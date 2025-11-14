{ lib, config, ... }:

{
  config.programs.plasma = lib.mkIf config.bobymoby.kde.enable {
    kwin = {
      virtualDesktops = {
        number = 5;
        rows = 1;
      };
      cornerBarrier = false;
      edgeBarrier = 0;
    };
    configFile.kwinrc = {
      "org.kde.kdecoration2" = {
        BorderSize = "None";
        BorderSizeAuto = false;
      };
      TabBox = {
        ActivitiesMode = 0;
        DesktopMode = 0;
        LayoutName = "compact";
        HighlightWindows = false;
      };
      Plugins = {
        fadingpopupsEnabled = false;
        zoomEnabled = false;
      };
    };
  };
}
