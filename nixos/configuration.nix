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
    bluetooth = {
      enable = true;
      powerOnBoot = false;
    };
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
  systemd = {
    user.services.polkit-gnome-authentication-agent-1 = {
      description = "polkit-gnome-authentication-agent-1";
      wantedBy = [ "graphical-session.target" ];
      wants = [ "graphical-session.target" ];
      after = [ "graphical-session.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };


  services.gnome.gnome-keyring.enable = true;

  services.gvfs.enable = true;

  virtualisation.docker.enable = true;

  services.flatpak.enable = true;

  programs.dconf.enable = true;

  system.stateVersion = "23.05";
}
