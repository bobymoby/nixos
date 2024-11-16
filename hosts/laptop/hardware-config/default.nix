{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./grub.nix
  ];

  boot.kernelParams = [
    "nvidia-drm.fbdev=1"
  ];

  programs.light.enable = true; # backlight control(brightness)

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
}
