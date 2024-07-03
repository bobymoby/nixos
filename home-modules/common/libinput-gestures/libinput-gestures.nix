{ lib, config, ... }:

let
  isUsingi3 = config.bobymoby.X11.i3.enable;
  isUsingHyprland = config.bobymoby.wayland.hyprland.enable;
  configPath = if isUsingi3 then ./x11-i3.conf else if isUsingHyprland then ./hyprland.conf else null;
in
{
  options.bobymoby.libinput-gestures.enable = lib.mkEnableOption "Enable libinput-gestures for X11";
  config = lib.mkIf config.bobymoby.libinput-gestures.enable {
    home.file."./.config/libinput-gestures.conf".source = configPath;
  };
}
