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

    home.file = {
      "./.config/rofi/onedark.rasi".source = ./onedark.rasi;
      "./.config/rofi/launcher.rasi".source = ./launcher.rasi;
      "./.config/rofi/fonts.rasi".source = ./fonts.rasi;
      "./.config/rofi/colors.rasi".source = ./colors.rasi;
    };
  };
}
