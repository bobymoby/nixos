{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    <home-manager/nixos>
  ];
  nixpkgs.config.allowUnfree = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true;
  networking.hostName = "nixos";

  time.timeZone = "Europe/Sofia";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "bg_BG.UTF-8";
    LC_IDENTIFICATION = "bg_BG.UTF-8";
    LC_MEASUREMENT = "bg_BG.UTF-8";
    LC_MONETARY = "bg_BG.UTF-8";
    LC_NAME = "bg_BG.UTF-8";
    LC_NUMERIC = "bg_BG.UTF-8";
    LC_PAPER = "bg_BG.UTF-8";
    LC_TELEPHONE = "bg_BG.UTF-8";
    LC_TIME = "bg_BG.UTF-8";
  };
	environment.systemPackages = with pkgs;[vscode];
  users.users.bobymoby = {
    isNormalUser = true;
    description = "Borimir Georgiev";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      firefox
      #  thunderbird
    ];
  };

  hardware.opengl = {
    enable = true;
    driSupport = true;
  };

  xdg.portal =
    {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
    };
  security.pam.services.swaylock.text = "auth include login";

  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    users.bobymoby = { pkgs, ... }: {
      programs = {
        home-manager = {
          enable = true;
        };
        alacritty = {
          enable = true;
        };
      };
      wayland.windowManager.sway = {
        enable = true;
        wrapperFeatures.gtk = true;
        config = {
          menu = "wofi --show run";
        };
      };
      home.stateVersion = "18.09";
      home.packages = with pkgs; [
        swaylock
        swayidle
        wl-clipboard
        mako
        alacritty
        wofi
        waybar
      ];
    };
  };
}
