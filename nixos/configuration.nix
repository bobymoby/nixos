{ config, pkgs, lib, ... }:

{
  # nix settings
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # hardware settings
  imports =
    [
      ./boot.nix
      ./hardware-configuration.nix
      ./gpu.nix
      ./sound.nix

      ./i18n.nix
      ./environment.nix
      ./window-manager.nix
      ./users.nix

      ./packages.nix
      ./fonts.nix
    ];

  programs.light.enable = true; # backlight control(brightness)

  services.blueman.enable = true;
  hardware = {
    openrazer.enable = true; # razer mouse control
    bluetooth.enable = true;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; #for gtk apps
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.gvfs.enable = true;

  virtualisation.docker.enable = true;

  services.flatpak.enable = true;

  programs.dconf.enable = true;

  system.stateVersion = "23.05";
}
