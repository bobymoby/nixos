{
  lib,
  config,
  pkgs,
  ...
}:
let
  unpFull = pkgs.unp.override { extraBackends = with pkgs; [ unrar ]; };
  # Xvlc = pkgs.vlc.override { waylandSupport = false; };
  # nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
  #   export __NV_PRIME_RENDER_OFFLOAD=1
  #   export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
  #   export __GLX_VENDOR_LIBRARY_NAME=nvidia
  #   export __VK_LAYER_NV_optimus=NVIDIA_only
  #   exec -a "$0" "$@"
  # '';
  extended-find = pkgs.writeShellScriptBin "findr" ''
    dir=$1
    shift
    find $dir -regextype posix-extended $*
  '';
  my-fhs =
    let
      base = pkgs.appimageTools.defaultFhsEnvArgs;
    in
    pkgs.buildFHSEnv (
      base
      // {
        name = "fhs";
        targetPkgs =
          pk:
          # pkgs.buildFHSEnv provides only a minimal FHS environment,
          # lacking many basic packages needed by most software.
          # Therefore, we need to add them manually.
          #
          # pkgs.appimageTools provides basic packages required by most software.
          (base.targetPkgs pk)
          ++ (with pk; [
            pkg-config
            ncurses
            # Feel free to add more packages here if needed.
          ]);
        profile = "export FHS=1";
        runScript = "zsh";
        extraOutputsToInstall = [ "dev" ];
      }
    );
in
{
  options.bobymoby.useDefaultPackages = lib.mkOption {
    default = true;
    type = lib.types.bool;
    description = "Use default packages";
  };

  config = lib.mkIf config.bobymoby.useDefaultPackages {
    services.flatpak.enable = true;
    xdg.portal.enable = true;

    programs.nix-ld = {
      enable = true;
      # libraries = with pkgs; [ ];
    };

    documentation.man.generateCaches = true;

    services.xserver.excludePackages = with pkgs; [ xterm ];
    environment.systemPackages = with pkgs; [
      # nvidia-offload
      #
      # xorg+i3
      #
      # polybarFull
      # xclip
      # maim
      # dex
      # xss-lock
      glib
      xdg-utils
      # lxappearance
      # xorg.xinit

      pavucontrol
      pamixer

      #
      # misc
      #
      unpFull # extract any archive
      unrar

      #
      # editors + utils
      #
      # nixd
      #
      # terminal + minor utils
      #
      gitFull
      libnotify
      killall
      eza # ls alternative
      jq # json parser
      nh # nix cli helper
      extended-find
      # kitty

      #
      # system monitoring
      #
      htop
      # nvtopPackages.full
      neofetch
      fastfetch
      lshw
      # fwupd
      gnome-system-monitor
      gnome-software
      eog # image viewer

      libGL
      ripgrep

      my-fhs

      # cachix
      # (python3.withPackages(ps: [ps.pytorch-bin]))
      # obsidian

      # inputs.quickshell.packages.${mySpecialArgs.system}.default
      vscode
      vscode.fhs
      code-cursor
      emacs
    ];
  };
}
