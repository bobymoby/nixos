{ gnome-extensions, ... }:
let
  enabled-extensions = map (ext: ext.extensionUuid) gnome-extensions;
in
{
  "org/gnome/shell".enabled-extensions = enabled-extensions;
  "org/gnome/shell/extensions/dash-to-dock" = {
    dock-position = "TOP";
    intellihide = false;
    require-pressure-to-show = false;
    multi-monitor = true;
    show-trash = false;
    hot-keys = false;
    running-indicator-style = "DOTS";
    transparency-mode = "DYNAMIC";
  };

  "org/gnome/shell/extensions/vitals" = {
    menu-centered = true;
    show-gpu = true;
    hot-sensors = [
      "__temperature_avg__"
    ];
  };
}
