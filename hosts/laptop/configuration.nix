{ config, pkgs, lib, ... }:

{
  imports = [ ./hardware-configuration.nix ];

  programs.light.enable = true; # backlight control(brightness)

  services.blueman.enable = true;
  hardware = {
    openrazer.enable = true; # razer mouse control
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
  };

  networking.hostName = "BobiLaptopNixOS";
  networking.networkmanager.enable = true;

  proprietary-nvidia-drivers = {
    enable = true;
    prime.enable = true;
  };
}
