{ pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth = {
      enable = true; # boot splash
      theme = "breeze";
      logo = pkgs.fetchurl {
        url = "https://nixos.org/logo/nixos-hires.png";
        sha256 = "1ivzgd7iz0i06y36p8m5w48fd8pjqwxhdaavc0pxs7w1g7mcy5si";
      };
    };
    initrd.systemd.enable = true;
    kernelParams = [
      "quiet"
      # "module_blacklist=i915" # disable intel gpu
    ];
    # kernelPackages = pkgs.linuxPackages_latest;
  };
}
