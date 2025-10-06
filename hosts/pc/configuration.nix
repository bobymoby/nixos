{ pkgs, ... }:

{
  imports = [ ./hardware-config ];

  networking.hostName = "BobiNixOS";

  bobymoby = {
    # window-manager.hyprland = {
    #   enable = true;
    #   autoStart = true;
    # };
    shell.zsh.enable = true;
    virtualization.enable = true;
    debug.enable = false;
    # netdata.enable = true;
  };

  services.ratbagd.enable = true; # needed for piper
  services.hardware.openrgb.enable = true;

  services.xserver.enable = true; # optional
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  services.displayManager.sddm.settings.General.DisplayServer = "wayland";

  environment.systemPackages = with pkgs; [
    piper # GUI for configuring gaming mice
    openrgb-with-all-plugins
  ];

}
