{ pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./spotlight-dark.rasi;
    terminal = "${pkgs.alacritty}/bin/alacritty";
  };
}
