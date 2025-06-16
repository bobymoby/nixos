{
  lib,
  config,
  pkgs,
  inputs,
  mySpecialArgs,
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
  btopCuda = pkgs.btop.override { cudaSupport = true; };
  pkgs-latest = import inputs.nixpkgs-latest {
    inherit inputs;
    inherit (mySpecialArgs) system overlays;
    config.allowUnfree = true;
  };
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
    environment.systemPackages = (with pkgs; [
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
      man-pages
      man-pages-posix
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
      # kitty

      #
      # system monitoring
      #
      htop
      btopCuda
      nvtopPackages.full
      neofetch
      fastfetch
      lshw # list gpus

      gnome-system-monitor
      gnome-software
      eog # image viewer

      libGL

      # cachix
      # (python3.withPackages(ps: [ps.pytorch-bin]))
      # obsidian

      # inputs.quickshell.packages.${mySpecialArgs.system}.default
    ]) ++ (with pkgs-latest; [
      vscode
      vscode.fhs
      code-cursor
      zed-editor
      neovim
    ]);
  };
}
