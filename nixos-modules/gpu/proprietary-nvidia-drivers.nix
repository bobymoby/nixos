{ config, lib, ... }:

{

  options = {
    proprietary-nvidia-drivers = {
      enable = lib.mkEnableOption "enable proprietary nvidia drivers";
      prime.enable = lib.mkEnableOption "enable prime";
    };
  };
  # boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  # boot.initrd.kernelModules = [ "nvidia" ];

  config = lib.mkIf config.proprietary-nvidia-drivers.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement = {
          # enable = true;
          finegrained = true;
        };
        open = false; #open source kernel module
        nvidiaSettings = true; #nvidia-settings menu
        # nvidiaPersistenced = true;
        prime = lib.mkIf config.proprietary-nvidia-drivers.prime.enable {
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
        };
      };
      opengl = {
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
      };
    };
  };
}
