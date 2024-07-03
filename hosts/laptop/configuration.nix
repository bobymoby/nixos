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
          search --no-floppy --fs-uuid --set=root 5C69-D966
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }

        menuentry "Firmware Settings" {
          fwsetup
        }
      '';
    };
  };

  # bobymoby.windowManager.i3Gnome.enable = true;
  bobymoby = {
    windowManager.hyprland.enable = true;
    desktopManager.gdm.enable = true;
    proprietary-nvidia-drivers = {
      enable = true;
      prime.enable = true;
    };
  };
}
