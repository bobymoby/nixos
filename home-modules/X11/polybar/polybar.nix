{ pkgs, lib, config, ... }:

{
  options.bobymoby.X11.polybar.enable = lib.mkEnableOption "Enable Polybar";

  config = lib.mkIf config.bobymoby.X11.polybar.enable {
    home.file."./.config/polybar/config.ini".source = ./config.ini;
    home.file."./.config/polybar/scripts/killtray.sh".source = ./scripts/killtray.sh;
    home.file."./.config/polybar/scripts/tray.sh".source = ./scripts/tray.sh;

    home.packages = with pkgs; [
      polybarFull
    ];
  };
}
