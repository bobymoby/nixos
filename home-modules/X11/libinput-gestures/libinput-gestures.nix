{ lib, config, ... }:

{
  options.bobymoby.X11.libinput-gestures.enable = lib.mkEnableOption "Enable libinput-gestures for X11";
  config = lib.mkIf config.bobymoby.X11.libinput-gestures.enable {
    home.file."./.config/libinput-gestures.conf".source = ./libinput-gestures.conf;
  };
}
