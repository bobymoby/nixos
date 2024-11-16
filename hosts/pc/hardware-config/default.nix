{ lib, config, ... }:

{
  imports = [
    ./hardware-configuration.nix
    # ./pstate.nix
    ./grub.nix
  ];

  # boot.initrd.availableKernelModules = [ "nvidia" ];
  # boot.initrd.kernelModules = [ "nvidia" ];
  # boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

  # boot.kernelModules = [
  #   "nvidia"
  #   "nvidia_modeset"
  #   "nvidia_drm"
  #   "nvidia_uvm"
  # ];

  # boot.kernelParams = [
  #  "nvidia-drm.modeset=1"
  #  nvidia.NVreg_RestrictProfilingToAdminUsers=0"
  # ];

  # security.tpm2 = {
  #   enable = true;
  #   pkcs11.enable = true;
  #   tctiEnvironment.enable = true;
  # };

  boot.kernelParams = [
    "nvidia-drm.fbdev=1"
    "amd_pstate=guided"
  ];

  boot.blacklistedKernelModules =
    ([
      "nouveau"
      "i2c_nvidia_gpu"
      "tpm"
      "tpm_crb"
      "k10temp"
    ])
    ++ (lib.optionals (!config.hardware.enableRedistributableFirmware) [ "ath3k" ]);

  boot.extraModulePackages = [ config.boot.kernelPackages.zenpower ];
  boot.kernelModules = [ "zenpower" ];

  services.fstrim.enable = lib.mkDefault true; # Enable periodic TRIM for SSDs

  powerManagement = {
    enable = true;
    cpuFreqGovernor = "schedutil";
  };

  systemd.tpm2.enable = false;

  bobymoby.gpu.proprietary-nvidia-drivers = {
    enable = true;
    forceFullCompositionPipeline = false;
    use-beta = true;
    use-production = false;
  };
}
