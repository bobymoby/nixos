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
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"
    "electron-19.1.9"
    "electron-25.9.0"
  ];

  programs.zsh.enable = true;
  services.flatpak.enable = true;
  environment.systemPackages = with pkgs; [
    nvidia-offload
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
    # io(controlled with sway/i3 bindings)
    #
    brightnessctl
    openrazer-daemon # razer mouse control
    polychromatic # razer gui
    pulseaudioFull
    pavucontrol
    easyeffects
    libinput-gestures

    #
    # misc
    #
    dunst # notifications
    google-chrome
    qbittorrent
    cinnamon.nemo # file manager
    firefox
    # etcher # usb flasher
    unpFull # extract any archive
    libreoffice
    discord
    spotify
    # ncspot # rust spotify client/cli
    gnome.gnome-software
    # Xvlc
    # vlc

    #
    # editors + utils
    #
    # vscodeWithExtensions
    vscode
    vscode.fhs
    jetbrains.rider
    jetbrains.idea-ultimate
    postman
    dbeaver-bin
    nixpkgs-fmt # nix formatter
    nil # nix linter
    arduino-ide
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
    # kitty
    htop
    killall
    gnome.gnome-system-monitor
    networkmanager_dmenu
    eza # ls alternative
    jq # json parser
    nh

    distrobox
    # curlWithGnutls

    #
    # gaming and windows emulation
    #
    wineWowPackages.full # wine
    lutris # wine prefix manager
    protonup-qt # proton installer
    bottles # container manager
    heroic # epic games launcher
    r2modman # mod manager
  ];

  programs.nix-ld = {
    enable = true;
    # libraries = with pkgs; [ ];
  };

  services.xserver.excludePackages = with pkgs; [ xterm ];
}
