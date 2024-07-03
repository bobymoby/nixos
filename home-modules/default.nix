{ ... }:

{
  imports = [
    ./libinput-gestures/libinput-gestures.nix
    ./shell

    ./gaming/gaming.nix

    ./wayland
    ./X11

    ./gnome-gdm

    ./common

  ];

  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi -dmenu -i
    [editor]
    gui_if_available = True
  '';

  home.username = "bobymoby";
  home.homeDirectory = "/home/bobymoby";
  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
