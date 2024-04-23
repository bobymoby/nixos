{ pkgs
, # inputs
  ...
}:

let
  #https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/data/themes/adi1090x-plymouth-themes/shas.nix
  #https://github.com/adi1090x/plymouth-themes/tree/master
  # plymouth-themes = pkgs.adi1090x-plymouth-themes.override {
  #   selected_themes = [
  #     "lone"
  #   ];
  # };
in
{
  boot = {
    supportedFilesystems = [ "ntfs" ];
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        device = "nodev";
        devices = [ "nodev" ];
        # useOSProber = true;

        # fontSize = 24;

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
      # grub2-theme.theme = "vimix";
    };

    # plymouth = {
    #   enable = true; # boot splash

    #   themePackages = with pkgs; [
    #     nixos-bgrt-plymouth
    #     plymouth-themes
    #   ];
    #   theme = "nixos-bgrt"; # spinning nixos logo
    # };
    initrd.systemd.enable = true;
    kernelParams = [
      "quiet"
      # "psmouse.synaptics_intertouch=0"
      # "intel_idle.max_cstate=1" # fix for random hangs

      # "module_blacklist=i915" # disable intel gpu
    ];

    kernelPackages = pkgs.linuxPackages_latest;
  };

  time.hardwareClockInLocalTime = true;
}
