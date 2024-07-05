{ pkgs, lib, config, ... }:

{
  options.bobymoby.wayland.rofi.enable = lib.mkEnableOption "Enable rofi";

  config = lib.mkIf config.bobymoby.wayland.rofi.enable {
    programs.rofi = {
      enable = true;
      package = pkgs.rofi-wayland;
      # theme = ./spotlight-dark.rasi;
      terminal = "${pkgs.alacritty}/bin/alacritty";
    };

    home.file."./.config/rofi" = {
      source = ./config;
      recursive = true;
    };
  };
}
