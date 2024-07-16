{ pkgs, ... }:

{
  home.packages = with pkgs; [
    networkmanagerapplet
    networkmanager_dmenu
  ];

  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi -dmenu -i
    [editor]
    gui_if_available = True
  '';
}
