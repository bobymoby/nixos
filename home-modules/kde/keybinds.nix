{ lib, config, ... }:

{
  config.programs.plasma = lib.mkIf config.bobymoby.kde.enable {
    shortcuts = {
      "KDE Keyboard Layout Switcher" = {
        "Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
        "Switch to Next Keyboard Layout" = "Meta+Alt+K";
      };
      "plasmashell"."manage activities" = [ ];
    };
  };
}
