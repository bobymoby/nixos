{
  lib,
  config,
  pkgs,
  ...
}:
let
  isUsingi3 = config.bobymoby.X11.i3.enable;
  isUsingHyprland = config.bobymoby.wayland.hyprland.enable;
  configPath =
    if isUsingi3 then
      ./i3.conf
    else if isUsingHyprland then
      ./hyprland.conf
    else
      null;
in
{
  options.bobymoby.libinput-gestures.enable = lib.mkEnableOption "Enable libinput-gestures";

  config = lib.mkIf config.bobymoby.libinput-gestures.enable {

    home = {
      packages = [
        pkgs.libinput-gestures
      ] ++ lib.optionals isUsingHyprland [ pkgs.ydotool ] ++ lib.optionals isUsingi3 [ pkgs.xdotool ];
      file.".config/libinput-gestures.conf".source = configPath;
    };
  };
}
