{ lib, config, ... }:

{
  config.programs.plasma = lib.mkIf config.bobymoby.kde.enable {
    powerdevil = {
      batteryLevels = {
        lowLevel = 20;
        criticalLevel = 10;
        criticalAction = "nothing";
      };
    };
    configFile.powerdevilrc = {
      "LowBattery/Display".UseProfileSpecificDisplayBrightness = false;
    };
  };
}
