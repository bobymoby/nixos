{...}:

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        devices = [ "nodev" ];

        useOSProber = true;

        extraEntries = ''
          menuentry "Firmware Settings" {
            fwsetup
          }
        '';
      };
    };
  };

  networking.hostName = "BobiNixOS";

  proprietary-nvidia-drivers.enable = true;
}