{ lib, config, ... }:

{

  options.bobymoby.proprietary-nvidia-drivers = {
    enable = lib.mkEnableOption "enable proprietary nvidia drivers";
    prime.enable = lib.mkEnableOption "enable prime";
    useBeta = lib.mkEnableOption "use beta packages";
    forceFullCompositionPipeline = lib.mkEnableOption "forceFullCompositionPipeline";
  };
  # boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  # boot.initrd.kernelModules = [ "nvidia" ];

  config = lib.mkIf config.bobymoby.proprietary-nvidia-drivers.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement = {
          enable = true;
          finegrained = config.bobymoby.proprietary-nvidia-drivers.prime.enable;
        };
        open = false; # open source kernel module
        nvidiaSettings = true; # nvidia-settings menu
        # nvidiaPersistenced = true;
        prime = lib.mkIf config.bobymoby.proprietary-nvidia-drivers.prime.enable {
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
          offload = {
            enable = true;
            enableOffloadCmd = true;
          };
        };

        package = lib.mkIf config.bobymoby.proprietary-nvidia-drivers.useBeta config.boot.kernelPackages.nvidiaPackages.beta;
        forceFullCompositionPipeline =
          config.bobymoby.proprietary-nvidia-drivers.forceFullCompositionPipeline;
      };
      opengl = {
        enable = true;
        driSupport32Bit = true;
      };
    };
  };
}
