{ ... }:

{

  imports = [
    #wayland + sway
    # ./sway/sway.nix
    # ./rofi-wayland-unwrapped/rofi-wayland-unwrapped.nix
    # ./waybar/waybar.nix

    ./gnome-gdm

    #xorg + i3
    ./i3/i3.nix
    ./rofi/rofi.nix
    ./picom/picom.nix
    ./polybar/polybar.nix
    ./dunst/dunst.nix

    ./gtk/gtk.nix

    ./libinput-gestures/libinput-gestures.nix

    #terminal
    ./zsh/zsh.nix
    ./alacritty/alacritty.nix
    ./fastfetch/fastfetch.nix

    #misc
    ./direnv/direnv.nix
    # ./vscode/vscode.nix
    ./easyeffects/easyeffects.nix
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
