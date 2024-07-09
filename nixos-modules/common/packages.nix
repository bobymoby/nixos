{ pkgs, ... }:
let
  unpFull = pkgs.unp.override {
    extraBackends = with pkgs; [
      unrar
    ];
  };
  Xvlc = pkgs.vlc.override {
    waylandSupport = false;
  };
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in
{
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-12.2.3"
  #   "electron-19.1.9"
  #   "electron-25.9.0"
  # ];

  services.flatpak.enable = true;
  xdg.portal.enable = true;

  programs.nix-ld = {
    enable = true;
    # libraries = with pkgs; [ ];
  };


  services.xserver.excludePackages = with pkgs; [ xterm ];
  environment.systemPackages = (with pkgs; [
    # nvidia-offload
    #
    # xorg+i3
    #
    # polybarFull
    # xclip
    # maim
    # picom
    # dex
    # xss-lock
    networkmanagerapplet
    glib
    xdg-utils
    # lxappearance # (kinda)bad practice to be used with nixos
    # xorg.xinit

    #
    # io
    #
    brightnessctl
    pulseaudioFull
    pavucontrol
    easyeffects
    libinput-gestures
    pamixer

    #
    # misc
    #
    dunst
    google-chrome
    firefox
    # etcher # usb flasher
    unpFull # extract any archive
    # ncspot # rust spotify client/cli
    # Xvlc

    #
    # editors + utils
    #
    # vscodeWithExtensions
    vscode
    vscode.fhs
    nixpkgs-fmt
    nil # nix linter
    # zed-editor
    # nixd
    # rustfmt # rust formatter

    #
    # terminal + minor utils
    #
    gitFull
    neofetch
    fastfetch
    lshw # list gpus
    libnotify
    # kitty
    htop
    btop
    killall
    networkmanager_dmenu
    eza # ls alternative
    jq # json parser
    nh
    ydotool
    nwg-bar
    tmux

    distrobox
    # curlWithGnutls
  ]) ++
  (with pkgs.gnome; [
    gnome-system-monitor
    gnome-software
    eog # image viewer
  ]);
}
