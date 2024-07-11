{ config, pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      devices = [ "nodev" ];

      default = "saved";

      extraEntries = ''
        menuentry 'Windows' --class windows --class os {
          savedefault
          insmod part_gpt
          insmod fat
          search --no-floppy --fs-uuid --set=root 86AF-BBA8
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }

        menuentry "Firmware Settings" {
          fwsetup
        }
      '';
    };
  };

  networking.hostName = "BobiNixOS";
  networking.networkmanager.enable = true;

  bobymoby = {
    windowManager.hyprland.enable = true;
    proprietary-nvidia-drivers = {
      enable = true;
      forceFullCompositionPipeline = false;
      useBeta = false;
    };

    shell.zsh.enable = true;
  };

  # boot.initrd.availableKernelModules = [ "nvidia" ];
  # boot.initrd.kernelModules = [ "nvidia" ];
  # boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];

  boot.kernelParams = [
    "nvidia-drm.fbdev=1"
    # "nvidia-drm.modeset=1"
    # "nvidia.NVreg_RestrictProfilingToAdminUsers=0"
  ];

  # boot.kernelModules = [
  #   "nvidia"
  #   "nvidia_modeset"
  #   "nvidia_drm"
  #   "nvidia_uvm"
  # ];

  boot.blacklistedKernelModules = [
    "nouveau"
    "i2c_nvidia_gpu"
    "tpm"
    "tpm_crb"
  ];

  # security.tpm2 = {
  #   enable = true;
  #   pkcs11.enable = true;
  #   tctiEnvironment.enable = true;
  # };

  services.ratbagd.enable = true;

  environment.systemPackages = with pkgs; [ piper ];

  # services.netdata = {
  #   enable = true;
  #   python.recommendedPythonPackages = true;
  #   configDir."python.d.conf" = pkgs.writeText "python.d.conf" ''
  #     nvidia_smi: yes
  #   '';
  # };
}
