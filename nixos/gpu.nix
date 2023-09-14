{ pkgs, config, ... }:

{
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
  # environment.systemPackages = with pkgs; [ linuxPackages.nvidia_x11 ];
  boot.initrd.kernelModules = [ "nvidia" ];
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware = {
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true;
      open = true; #open source kernel module
      nvidiaSettings = true; #nvidia-settings menu
      prime = {
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
}
