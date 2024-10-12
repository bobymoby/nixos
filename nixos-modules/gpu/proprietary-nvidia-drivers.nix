{ lib, config, ... }:

let
  nvidiaPackages = config.boot.kernelPackages.nvidiaPackages;
  driver-version =
    if config.bobymoby.gpu.proprietary-nvidia-drivers.use-production then
      nvidiaPackages.production
    else if config.bobymoby.gpu.proprietary-nvidia-drivers.use-beta then
      nvidiaPackages.beta
    else
      nvidiaPackages.stable;
in
{
  options.bobymoby.gpu.proprietary-nvidia-drivers = {
    enable = lib.mkEnableOption "enable proprietary nvidia drivers";
    prime = {
      enable = lib.mkEnableOption "enable prime";
      sync = lib.mkEnableOption "enable prime sync";
      offload = lib.mkEnableOption "enable prime offload";
    };
    use-beta = lib.mkEnableOption "use beta packages";
    use-production = lib.mkEnableOption "use production packages";
    forceFullCompositionPipeline = lib.mkEnableOption "forceFullCompositionPipeline";
  };
  # boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  # boot.initrd.kernelModules = [ "nvidia" ];

  config = lib.mkIf config.bobymoby.gpu.proprietary-nvidia-drivers.enable {
    services.xserver.videoDrivers = [ "nvidia" ];
    hardware = {
      nvidia = {
        modesetting.enable = true;
        powerManagement = {
          enable = true;
          finegrained = config.bobymoby.gpu.proprietary-nvidia-drivers.prime.offload;
        };
        open = false; # open source kernel module
        nvidiaSettings = true; # nvidia-settings menu
        # nvidiaPersistenced = true;
        prime = lib.mkIf config.bobymoby.gpu.proprietary-nvidia-drivers.prime.enable {
          intelBusId = "PCI:0:2:0";
          nvidiaBusId = "PCI:1:0:0";
          offload = lib.mkIf config.bobymoby.gpu.proprietary-nvidia-drivers.prime.offload {
            enable = true;
            enableOffloadCmd = true;
          };

          sync.enable = config.bobymoby.gpu.proprietary-nvidia-drivers.prime.sync;
        };

        package = driver-version;
        forceFullCompositionPipeline =
          config.bobymoby.gpu.proprietary-nvidia-drivers.forceFullCompositionPipeline;
      };
      graphics = {
        enable = true;
        enable32Bit = true;
      };
    };
  };
}
