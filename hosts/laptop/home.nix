{ ... }:

{

  imports = [
    #wayland + sway
    # ../../home-modules/sway/sway.nix
    # ../../home-modules/rofi-wayland-unwrapped/rofi-wayland-unwrapped.nix
    # ../../home-modules/waybar/waybar.nix

    ../../home-modules/gnome-gdm

    #xorg + i3
    ../../home-modules/i3/i3.nix
    ../../home-modules/rofi/rofi.nix
    ../../home-modules/picom/picom.nix
    ../../home-modules/polybar/polybar.nix
    ../../home-modules/dunst/dunst.nix

    ../../home-modules/gtk/gtk.nix

    ../../home-modules/libinput-gestures/libinput-gestures.nix

    #terminal
    ../../home-modules/zsh/zsh.nix
    ../../home-modules/alacritty/alacritty.nix
    ../../home-modules/fastfetch/fastfetch.nix

    #misc
    ../../home-modules/direnv/direnv.nix
    # ../../home-modules/vscode/vscode.nix
    ../../home-modules/easyeffects/easyeffects.nix
  ];

  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi -dmenu -i
    [editor]
    gui_if_available = True
  '';
}
