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
          search --no-floppy --fs-uuid --set=root 86AF-BBA8
          chainloader /EFI/Microsoft/Boot/bootmgfw.efi
        }

        menuentry "Firmware Settings" {
          fwsetup
        }
      '';
    };
  };
}
