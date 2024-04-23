{ config, pkgs, lib, ... }:

{
  # nix settings
  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # hardware settings
  imports =
    [
      ./boot.nix
      ./hardware-configuration.nix
      ./gpu.nix
      ./sound.nix
      ./input.nix
      ./ssh/ssh.nix

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

  networking.hostName = "BobiLaptopNixOS";
  networking.networkmanager.enable = true;

  services.dbus.enable = true;
<<<<<<< HEAD
=======
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    # extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; #for gtk apps
    extraPortals = with pkgs; [
      xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gnome
      (pkgs.xdg-desktop-portal-gtk.override {
        # Do not build portals that we already have.
        buildPortalsInGnome = false;
      })
    ];
    # gtkUsePortal = true;
    # config.common.default = "*";
  };
>>>>>>> ee331c3 (users video group/gdm default session/sway+gnome configs/vscode flags)

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
  security.pam.services.gdm.enableGnomeKeyring = true;

  services.gvfs.enable = true;

  virtualisation.docker.enable = true;

  programs.dconf.enable = true;



  # DO NOT CHANGE. USED FOR COMPATIBILITY.
  # maybe change on reinstall
  system.stateVersion = "23.05";
}
