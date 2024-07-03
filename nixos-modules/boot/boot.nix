{ pkgs, ... }:

# let
#https://github.com/NixOS/nixpkgs/blob/nixos-23.05/pkgs/data/themes/adi1090x-plymouth-themes/shas.nix
#https://github.com/adi1090x/plymouth-themes/tree/master
# plymouth-themes = pkgs.adi1090x-plymouth-themes.override {
#   selected_themes = [
#     "lone"
#   ];
# };
# in
{
  # boot = {
  # plymouth = {
  #   enable = true; # boot splash

  #   themePackages = with pkgs; [
  #     nixos-bgrt-plymouth
  #     plymouth-themes
  #   ];
  #   theme = "nixos-bgrt"; # spinning nixos logo
  # };
  # initrd.systemd.enable = true;
  # kernelParams = [
  #   "quiet"
  #   # "psmouse.synaptics_intertouch=0"
  #   # "intel_idle.max_cstate=1" # fix for random hangs

  #   # "module_blacklist=i915" # disable intel gpu
  # ];

  # kernelPackages = pkgs.linuxPackages_latest;
  # };


  boot = {
    kernelParams = [
      "quiet"
    ];

    kernelPackages = pkgs.linuxPackages_latest;
    initrd.systemd.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
  time.hardwareClockInLocalTime = true;
}
