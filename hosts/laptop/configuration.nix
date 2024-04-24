{ ... }:

{
  imports = [ ./hardware-configuration.nix ];

  programs.light.enable = true; # backlight control(brightness)

  services.blueman.enable = true;
  hardware = {
    openrazer.enable = true; # razer mouse control
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };

  networking.hostName = "BobiLaptopNixOS";
  networking.networkmanager.enable = true;

  proprietary-nvidia-drivers = {
    enable = true;
    prime.enable = true;
  };

  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        devices = [ "nodev" ];

        extraEntries = ''
          menuentry 'Windows' --class windows --class os {
            insmod part_gpt
            insmod fat
            search --no-floppy --fs-uuid --set=root 5C69-D966
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
          
          menuentry "Firmware Settings" {
            fwsetup
          }
        '';

        gfxmodeEfi = "text";
        gfxmodeBios = "text";
      };
    };
  };
}
