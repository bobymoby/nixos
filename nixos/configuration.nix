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

      ./i18n.nix
      ./environment.nix

      ./packages.nix
      ./fonts.nix
    ];

  programs.light.enable = true; # backlight control(brightness)
  sound.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    #jack.enable = true; #for JACK applications
  };
  services.blueman.enable = true;

  hardware = {
    openrazer.enable = true; # razer mouse control
    pulseaudio = {
      # enable = true;
      support32Bit = true;
    };
    bluetooth.enable = true;
  };

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;

  users.users.bobymoby = {
    isNormalUser = true;
    description = "Borimir Georgiev";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" "input" "kvm" "adbusers" "i2c" "openrazer" "plugdev" ];
  };

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; #for gtk apps
  };

  security.rtkit.enable = true;
  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  services.gvfs.enable = true;

  virtualisation.docker.enable = true;

  services.flatpak.enable = true;

  programs.dconf.enable = true;

  # x+i3 setup
  environment.pathsToLink = [ "/libexec" ];
  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "none+i3";
      autoLogin = {
        # WIP disable later
        enable = true;
        user = "bobymoby";
      };
      lightdm = {
        enable = true;
        background = ../home-manager/i3/background.png;
        greeter.enable = false; # WIP enable later
      };
    };
    desktopManager.xterm.enable = false;
    windowManager.i3 = {
      enable = true;
    };
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
      };
      mouse = {
        accelProfile = "flat";
      };
    };
    layout = "us,bg";
    xkbVariant = "altgr-intl,phonetic";
    xkbOptions = "grp:alt_shift_toggle";
    excludePackages = with pkgs; [
      xterm
    ];
  };

  #wayland+sway setup
  # services.xserver = {
  #   enable = true;
  #   displayManager = {
  #     sddm.enable = true;
  #     # gdm = {
  #     #   enable = true;
  #     #   wayland = true;
  #     # };
  #     # # sessionPackages = with pkgs; [ sway ];
  #     # defaultSession = "nvidiasway";
  #     session = [
  #       {
  #         manage = "desktop";
  #         name = "nvidiasway";
  #         start = ''
  #           exec sway --unsupported-gpu
  #         '';
  #       }
  #     ];
  #   };
  #   videoDrivers = [ "nvidia" ];
  # };
  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true;
  #   package = (pkgs.swayfx.overrideAttrs
  #     (old: {
  #       passthru.providedSessions = [ "sway" ];
  #     }));
  #   extraOptions = [ "--unsupported-gpu" ];
  # };

  system.stateVersion = "23.05";
}
