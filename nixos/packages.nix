{ pkgs, ... }:
let
  # bash script to let dbus know about important env variables and
  # propagate them to relevent services run at the end of sway config
  # see
  # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/"It-doesn't-work"-Troubleshooting-Checklist
  # note: this is pretty much the same as  /etc/sway/config.d/nixos.conf but also restarts  
  # some user services to make sure they have the correct environment variables
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };
  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure-gtk";
    executable = true;
    text =
      let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gsettings-schemas/${schema.name}";
      in
      ''
        export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
        gnome_schema=org.gnome.desktop.interface
        gsettings set $gnome_schema gtk-theme 'Dracula'
      '';
  };
in
{
  environment.systemPackages = with pkgs; [
    #wayland+sway
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

    #x+i3
    i3status
    picom
    dex
    xss-lock
    networkmanagerapplet
    configure-gtk
    xdg-utils
    eww # widget framework
    # qol
    chromium
    qbittorrent
    # editors + utils
    vscode
    neovim
    nixpkgs-fmt
    # terminal + minor utils
    git
    zsh
    neofetch
    fastfetch
    alacritty
    lshw # list gpus
    # io(controlled with sway bindings)
    pulseaudio
    brightnessctl
    # razer mouse control
    openrazer-daemon
    polychromatic # gui
    # gaming and windows emulation
    # wine
    # winetricks
    wineWowPackages.full
    # wineWowPackages.staging
    lutris
    protonup-qt
    # vulkan-tools
    # dxvk
    bottles
    heroic
    # nvidia-dkms
    # nvidia-utils
    # lib32-nvidia-utils
    # nvidia-settings
    # vulkan-icd-loader
    # lib32-vulkan-icd-loader

  ];
}
