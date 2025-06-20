{ pkgs, ... }:

{
  imports = [ ./hardware-config ];

  networking.hostName = "BobiNixOS";

  bobymoby = {
    window-manager.hyprland = {
      enable = true;
      autoStart = true;
    };
    shell.zsh.enable = true;
    virtualization.enable = true;
    debug.enable = true;
    # netdata.enable = true;
  };

  services.ratbagd.enable = true; # needed for piper
  services.hardware.openrgb.enable = true;

  environment.systemPackages = with pkgs; [
    piper # GUI for configuring gaming mice
    openrgb-with-all-plugins
  ];

}
