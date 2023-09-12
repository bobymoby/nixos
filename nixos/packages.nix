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
  #     '';
  # };
  # load-nix-index = ''
  #   source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
  # '';
  tray = pkgs.writeTextFile {
    name = "tray";
    destination = "/bin/tray";
    executable = true;
    text = "polybar tray";
  };
  unpFull = pkgs.unp.override {
    extraBackends = with pkgs; [
      unrar
    ];
  };
in
{
  nixpkgs.config.permittedInsecurePackages = [
    "electron-12.2.3"
  ];
  programs.zsh.enable = true;
  environment.systemPackages = with pkgs; [
    # wayland+sway
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

    # xorg+i3
    polybarFull
    tray
    xclip
    maim
    picom
    dex
    xss-lock
    networkmanagerapplet
    # configure-gtk
    glib
    xdg-utils
    eww # widget framework
    lxappearance # (kinda)bad practice to be used with nixos

    # io(controlled with sway bindings)
    brightnessctl
    openrazer-daemon # razer mouse control
    polychromatic # razer gui
    pulseaudioFull
    pavucontrol
    easyeffects

    # misc
    chromium
    # google-chrome
    qbittorrent
    cinnamon.nemo # file manager
    etcher # usb flasher
    unpFull # extract any archive
    libreoffice
    discord
    spotify
    gnome.gnome-software

    # dev
    python3
    nodejs

    # editors + utils
    vscode
    neovim
    nixpkgs-fmt # nix formatter

    # terminal + minor utils
    git
    neofetch
    fastfetch
    lshw # list gpus
    kitty
    htop
    killall
    gnome.gnome-system-monitor
    networkmanager_dmenu

    # gaming and windows emulation
    wineWowPackages.full # wine
    lutris # game manager
    protonup-qt # proton installer
    bottles # container manager
    heroic # epic games launcher
  ];
}
