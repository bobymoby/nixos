{
  pkgs,
  lib,
  config,
  ...
}:

{
  options.bobymoby.X11.polybar.enable = lib.mkEnableOption "Enable Polybar";

  config = lib.mkIf config.bobymoby.X11.polybar.enable {
    home.file.".config/polybar" = {
      source = ./config;
      recursive = true;
    };

    home.packages = with pkgs; [ polybarFull ];
  };
}
