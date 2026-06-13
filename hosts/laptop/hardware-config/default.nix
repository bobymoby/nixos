{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./grub.nix
  ];

  boot.kernelParams = [
    "nvidia-drm.fbdev=1"
  ];

  # programs.light.enable = true; # backlight control(brightness)

  environment.systemPackages = with pkgs; [ brightnessctl ];

  bobymoby = {
    gpu.proprietary-nvidia-drivers = {
      enable = true;
      prime = {
        enable = true;
        # sync = true;
        offload = true;
      };
      use-production = true;
    };
    bluetooth.enable = true;
  };

  hardware.graphics.extraPackages = with pkgs; [
    intel-media-driver
  ];
  environment.sessionVariables.LIBVA_DRIVER_NAME = "iHD";

  services.fwupd.enable = true;

  # networking = {
  #   useNetworkd = true;
  #   dhcpcd.enable = false;
  # };

  facter.reportPath = ./facter.json;

  # services.thermald.enable = true;
  services.tlp = {
    enable = true;
    pd.enable = true;
    settings = {
      TLP_PERSISTENT_DEFAULT = 1;
      TLP_DEFAULT_MODE = "BAT";
      USB_AUTOSUSPEND = 0;
    };
  };

  # Keep ELAN I2C touchpad awake — runtime PM suspend causes ~2min sluggishness on wake.
  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="i2c", KERNELS=="i2c-DELL0A71:00", ATTR{power/control}="on"
  '';
}
