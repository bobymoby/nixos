{ inputs, pkgs, ... }:

let
  #https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/data/themes/adi1090x-plymouth-themes/shas.nix
  #https://github.com/adi1090x/plymouth-themes/tree/master
  plymouth-themes = pkgs.adi1090x-plymouth-themes.override {
    selected_themes = [
      "lone"
    ];
  };
in
{
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = {
      #systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        devices = [ "nodev" ];
        # useOSProber = true;

        fontSize = 24;

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
      };
      grub2-theme.theme = "vimix";
    };

    plymouth = {
      enable = true; # boot splash
      # theme = "breeze";
      # NixOS BGRT
      # logo = pkgs.fetchurl {
      #   url = "https://nixos.org/logo/nixos-hires.png";
      #   sha256 = "1ivzgd7iz0i06y36p8m5w48fd8pjqwxhdaavc0pxs7w1g7mcy5si";
      # };

      themePackages = with pkgs; [
        nixos-bgrt-plymouth
        plymouth-themes
      ];
      theme = "nixos-bgrt"; # spinning nixos logo
      # theme = "lone";
    };
    initrd.systemd.enable = true;
    kernelParams = [
      "quiet"

      # "intel_idle.max_cstate=1" # fix for random hangs

      # fix for crash after suspend
      # "acpi_rev_override=1"
      # "acpi_osi=Linux"
      # "nouveau.modeset=0"
      # "pcie_aspm=force"
      # "drm.vblankoffdelay=1"
      # "scsi_mod.use_blk_mq=1"
      # "nouveau.runpm=0"
      # "mem_sleep_default=deep"
      # "ibt=off"

      # "module_blacklist=i915" # disable intel gpu
    ];
    # kernelPackages = pkgs.linuxPackages_latest;
  };

  time.hardwareClockInLocalTime = true;
}
