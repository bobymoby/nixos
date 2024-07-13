{ lib, config, ... }:

{
  options.bobymoby.bluetooth.enable = lib.mkEnableOption "Enable Bluetooth";

  config = lib.mkIf config.bobymoby.bluetooth.enable {
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };
}
