{ pkgs, ... }:

{

  imports = [
    #wayland + sway
    # ./sway/sway.nix
    # ./rofi-wayland-unwrapped/rofi-wayland-unwrapped.nix
    # ./waybar/waybar.nix

    #wayland + hyprland
    # ./rofi-wayland-unwrapped/rofi-wayland-unwrapped.nix
    # ./waybar/waybar.nix
    # ./hyprland/hyprland.nix

    #xorg + i3
    ./i3/i3.nix
    ./rofi/rofi.nix
    ./picom/picom.nix
    ./polybar/polybar.nix
    # ./i3status-rust/i3status-rust.nix

    ./gtk/gtk.nix
    ./eww/eww.nix

    #terminal
    ./zsh/zsh.nix
    ./alacritty/alacritty.nix

    #misc
    ./direnv/direnv.nix
    # ./vscode/vscode.nix
    ./easyeffects/easyeffects.nix
  ];

  home.packages = with pkgs; [
    # gnome.adwaita-icon-theme
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
