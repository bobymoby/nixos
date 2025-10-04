{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.wayland.rofi.enable = lib.mkEnableOption "Enable rofi";

  config = lib.mkIf config.bobymoby.wayland.rofi.enable {
    programs.rofi = {
      enable = true;
      #   package = pkgs.rofi-wayland;
      # theme = ./spotlight-dark.rasi;
      # terminal = "${pkgs.alacritty}/bin/alacritty";
      terminal = "${pkgs.kitty}/bin/kitty";
    };

    home.file.".config/rofi" = {
      source = ./config;
      recursive = true;
    };
  };
}
