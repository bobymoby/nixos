{ lib, config, ... }:

{
  config.programs.plasma = lib.mkIf config.bobymoby.kde.enable {
    hotkeys.commands = {
      launch-alacritty = {
        name = "Launch Kitty";
        key = "Meta+Return";
        command = "kitty";
      };
    };
    shortcuts = {
      "KDE Keyboard Layout Switcher" = {
        "Switch to Last-Used Keyboard Layout" = "Meta+Alt+L";
        "Switch to Next Keyboard Layout" = "Meta+Alt+K";
      };
      plasmashell = {
        "manage activities" = [ ];
        "activate task manager entry 1" = [ ];
        "activate task manager entry 2" = [ ];
        "activate task manager entry 3" = [ ];
        "activate task manager entry 4" = [ ];
        "activate task manager entry 5" = [ ];
        "activate task manager entry 6" = [ ];
        "activate task manager entry 7" = [ ];
        "activate task manager entry 8" = [ ];
        "activate task manager entry 9" = [ ];
        "activate task manager entry 10" = [ ];
      };
      kwin = {
        "view_zoom_in" = [ ];
        "view_zoom_out" = [ ];
        "view_actual_size" = [ ];
        "Window Close" = [
          "Alt+F4"
          "Meta+Shift+Q"
        ];
        "Switch to Desktop 1" = "Meta+1";
        "Switch to Desktop 2" = "Meta+2";
        "Switch to Desktop 3" = "Meta+3";
        "Switch to Desktop 4" = "Meta+4";
        "Switch to Desktop 5" = "Meta+5";
        "Window to Desktop 1" = "Meta+!";
        "Window to Desktop 2" = "Meta+@";
        "Window to Desktop 3" = "Meta+#";
        "Window to Desktop 4" = "Meta+$";
        "Window to Desktop 5" = "Meta+%";
        "Window Quick Tile Top" = [ ];
        "Window Maximize" = "Meta+Up";
      };
      "services/org.kde.konsole.desktop"."_launch" = [ ];
    };
  };
}
