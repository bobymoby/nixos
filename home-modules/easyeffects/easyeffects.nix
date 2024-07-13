{ lib, config, pkgs, ... }:

{
  options.bobymoby.easyeffects.enable = lib.mkEnableOption "Enable easyeffects";

  config = lib.mkIf config.bobymoby.easyeffects.enable {
    home.file.".config/easyeffects/input" = {
      source = ./presets;
      recursive = true;
    };

    home.packages = with pkgs; [ easyeffects ];
  };
}
