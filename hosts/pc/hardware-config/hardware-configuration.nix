{
  config,
  lib,
  pkgs,
  modulesPath,
  tools,
  ...
}:

{
  imports = [ (modulesPath + "/installer/scan/not-detected.nix") ];

  boot.initrd.availableKernelModules = [
    "nvme"
    "xhci_pci"
    "ahci"
    "usbhid"
    "usb_storage"
    "sd_mod"
  ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/cbec95eb-31b3-4a71-9938-8a027124c14f";
      fsType = "ext4";
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/0FC2-9E38";
      fsType = "vfat";
      options = [
        "fmask=0022"
        "dmask=0022"
      ];
    };

    "/windows/C" = {
      device = "/dev/disk/by-uuid/2838BF4A38BF15B2";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
      ];
    };

    "/windows/D" = {
      device = "/dev/disk/by-uuid/A62639652639379F";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
      ];
    };

    "/windows/E" = {
      device = "/dev/disk/by-uuid/B688A03C889FF957";
      fsType = "ntfs-3g";
      options = [
        "rw"
        "uid=1000"
      ];
    };
  };

  swapDevices = [
    {
      device = "/swapfile";
      size = 4 * 1024;
    }
  ];
  
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp37s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault tools.systems.x86_64-linux;
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
