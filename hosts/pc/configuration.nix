{ config, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  #boot = {
  #  supportedFilesystems = [ "ntfs" ];
  #  loader = {
  #    efi.canTouchEfiVariables = true;
  #    grub = {
  #      enable = true;
  #      efiSupport = true;
  #      device = "nodev";
  #      devices = [ "nodev" ];

  #      useOSProber = true;

  #      extraEntries = ''
  #        menuentry "Firmware Settings" {
  #          fwsetup
  #        }
  #      '';
  #    };
  #  };
  #};

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "BobiNixOS";
  networking.networkmanager.enable = true;

  bobymoby = {
    windowManager = {
      hyprland.enable = true;

      i3.enable = false;
    };
    desktopManager = {
      gdm.enable = true;

      lightdm.enable = false;
    };
    proprietary-nvidia-drivers = {
      enable = true;
      forceFullCompositionPipeline = true;
      useBeta = true;
      prime.enable = false;
    };

    shell = {
      zsh.enable = true;
      fish.enable = false;
    };
  };
  boot.initrd.kernelModules = [ "nvidia" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
}
