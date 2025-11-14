{ lib, config, ... }:

{
  config.programs.plasma = lib.mkIf config.bobymoby.kde.enable {
    powerdevil = {
      batteryLevels = {
        lowLevel = 20;
        criticalLevel = 10;
        criticalAction = "nothing";
      };
      AC = lib.mkIf config.bobymoby.kde.use-pc-config {
        autoSuspend.action = "nothing";
        dimDisplay.enable = false;
      };
    };
    configFile.powerdevilrc = {
      "LowBattery/Display".UseProfileSpecificDisplayBrightness = false;
    };
  };
}
