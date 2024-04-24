{ lib, config, ... }:

{
  options.bobymoby.X11.i3.enable = lib.mkEnableOption "Enable i3";
  config = lib.mkIf config.bobymoby.X11.i3.enable {
    home.file."./.config/i3/config".source = ./i3config;
  };
}
