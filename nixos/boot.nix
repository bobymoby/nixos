{ ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    plymouth.enable = true; # boot splash
    plymouth.theme = "breeze";
    initrd.systemd.enable = true;
    kernelParams = [
      "quiet"
      # "module_blacklist=i915" # disable intel gpu
    ];
    # kernelPackages = pkgs.linuxPackages_latest;
  };
}
