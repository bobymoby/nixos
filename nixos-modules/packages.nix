{ pkgs, ... }:
let
  # bash script to let dbus know about important env variables and
  # propagate them to relevent services run at the end of sway config
  # see
  # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/"It-doesn't-work"-Troubleshooting-Checklist
  # note: this is pretty much the same as  /etc/sway/config.d/nixos.conf but also restarts  
  # some user services to make sure they have the correct environment variables
  # dbus-sway-environment = pkgs.writeTextFile {
  #   name = "dbus-sway-environment";
  #   destination = "/bin/dbus-sway-environment";
  #   executable = true;

  #   text = ''
  #     dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
  #     systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
  #     systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
  #   '';
  # };
  # configure-gtk = pkgs.writeTextFile {
  #   name = "configure-gtk";
  #   destination = "/bin/configure-gtk";
  #   executable = true;
  #   text =
  #     let
  #       schema = pkgs.gsettings-desktop-schemas;
  #       datadir = "${schema}/share/gsettings-schemas/${schema.name}";
  #     in
  #     ''
  #       export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
  #       gnome_schema=org.gnome.desktop.interface
  #       gsettings set $gnome_schema gtk-theme 'Dracula'
  #    '';
  # };
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
    #
    # gpu offloading
    #
    nvidia-offload

    #
    # wayland+sway
    #
    # dbus-sway-environment
    # configure-gtk
    # wayland
    # xdg-utils
    # glib
    # swaylock
    # swayidle
    # grim
    # slurp
    # wl-clipboard
    # bemenu
    # mako
    # wdisplays
    # configure-gtk

    #
    # xorg+i3
    #
    polybarFull
    # tray
    xclip
    maim
    picom
    dex
    xss-lock
    networkmanagerapplet
    glib
    xdg-utils
    eww # widget framework
    lxappearance # (kinda)bad practice to be used with nixos
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
    # etcher # usb flasher
    unpFull # extract any archive
    libreoffice
    discord
    spotify
    # ncspot # rust spotify client/cli
    gnome.gnome-software
    Xvlc

    #
    # dev
    #
    # python3
    # nodejs
    # gcc # for vscode extension
    # rustup # for vscode extension
    # cargo
    clippy
    # rustc
    # rust-analyzer

    #
    # editors + utils
    #
    # vscodeWithExtensions
    vscode
    vscode.fhs
    jetbrains.rider
    jetbrains.idea-ultimate
    bruno # postman alternative (cant download postman atm for some reason)
    dbeaver
    neovim
    nixpkgs-fmt # nix formatter
    nil
    # nixd
    # rustfmt # rust formatter

    #
    # terminal + minor utils
    #
    gitFull
    neofetch
    fastfetch
    lshw # list gpus
    kitty
    htop
    killall
    gnome.gnome-system-monitor
    networkmanager_dmenu
    eza # ls alternative
    jq # json parser
    nh
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

  services.xserver.excludePackages = with pkgs; [ xterm ];
}
