{ pkgs, ... }:

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
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
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
      # "module_blacklist=i915" # disable intel gpu
    ];
    # kernelPackages = pkgs.linuxPackages_latest;
  };
}
