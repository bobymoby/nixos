{
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
}
