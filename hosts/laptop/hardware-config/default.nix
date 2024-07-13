{ pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./grub.nix
  ];

  programs.light.enable = true; # backlight control(brightness)

  environment.systemPackages = with pkgs; [ brightnessctl ];

  bobymoby = {
    proprietary-nvidia-drivers = {
      enable = true;
      prime.enable = true;
    };
    bluetooth.enable = true;
  };
}
