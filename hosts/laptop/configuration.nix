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

    # extraModprobeConfig = ''
    #   options snd_hda_intel power_save=0
    # '';
  };

  # bobymoby.windowManager.i3Gnome.enable = true;
  bobymoby = {
    windowManager = {
      hyprland.enable = true;

      i3.enable = false;
    };
    loginManager = {
      gdm.enable = true;

      lightdm.enable = false;
    };
    proprietary-nvidia-drivers = {
      enable = true;
      prime.enable = true;
    };

    shell = {
      zsh.enable = true;
      fish.enable = false;
    };
  };
}
