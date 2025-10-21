{ lib, config, ... }:

{
  options.bobymoby.bluetooth.enable = lib.mkEnableOption "Enable Bluetooth";

  config = lib.mkIf config.bobymoby.bluetooth.enable {
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      powerOnBoot = false;
    };

    # services.pipewire.wireplumber.extraConfig."10-bluez" = {
    #   "monitor.bluez.properties" = {
    #     "bluez5.enable-sbc-xq" = true;
    #     "bluez5.enable-msbc" = false;
    #     "bluez5.enable-hw-volume" = true;
    #     # "bluez5.roles" = [
    #     #   "hsp_hs"
    #     #   "hsp_ag"
    #     #   "hfp_hf"
    #     #   "hfp_ag"
    #     # ];
    #     "bluez5.headset-roles" = [ "none" ]; # disables HSP/HFP
    #   };
    # };
  };
}
