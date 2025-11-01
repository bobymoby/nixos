{ pkgs, ... }:

{
  imports = [ ./hardware-config ];

  networking.hostName = "BobiNixOS";

  bobymoby = {
    # desktop-environment.hyprland = {
    #   enable = true;
    #   autoStart = true;
    # };
    # desktop-environment.kde.enable = true;
    # login-manager.sddm = {
    #   enable = true;
    #   wayland.enable = true;
    # };
    # desktop-environment.gnome.enable = true;
    # login-manager.gdm.enable = true;
    kde.enable = true;
    shell.zsh.enable = true;
    virtualization.enable = true;
    debug.enable = false;
    # netdata.enable = true;
  };

  # boot.kernelPackages = pkgs.linuxPackages_cachyos;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.ratbagd.enable = true; # needed for piper
  services.hardware.openrgb.enable = true;

  environment.systemPackages = with pkgs; [
    piper # GUI for configuring gaming mice
    openrgb-with-all-plugins
  ];

}
