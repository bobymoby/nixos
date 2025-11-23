{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.X11.polybar.enable = tools.mkEnableOption "Enable Polybar";

  config = lib.mkIf config.bobymoby.X11.polybar.enable {
    home.file.".config/polybar" = {
      source = ./config;
      recursive = true;
    };

    home.packages = with pkgs; [ polybarFull ];
  };
}
