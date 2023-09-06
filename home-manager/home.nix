{ config, pkgs, lib, ... }:

{

  imports = [
    # ./polybar/polybar.nix
    ./rofi-wayland-unwrapped/rofi-wayland-unwrapped.nix
    ./picom/picom.nix
    ./waybar/waybar.nix
  ];

  home.username = "bobymoby";
  home.homeDirectory = "/home/bobymoby";

  home.stateVersion = "23.05";

  # useUserPackages = true;
  # useGlobalPkgs = true;

  home.packages = with pkgs; [
    htop
    killall
    gnome.gnome-software
    networkmanager_dmenu
    spotify
    gnome.adwaita-icon-theme
    gnome.gnome-system-monitor
    libreoffice
    webcord
  ];

  gtk = {
    enable = true;
    theme = {
      name = "Gruvbox-Dark-B";
      package = pkgs.gruvbox-gtk-theme;
    };
    iconTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };
    cursorTheme = {
      name = "Bibata-Modern-Classic";
      package = pkgs.bibata-cursors;
      size = 24;
    };

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  xdg.configFile."networkmanager-dmenu/config.ini".text = ''
    [dmenu]
    dmenu_command = rofi -dmenu -i
    [editor]
    gui_if_available = True
  '';

  services.gnome-keyring.enable = true;

  programs = {
    home-manager.enable = true;
    waybar.enable = true;
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };

  # wayland.windowManager.sway = {
  #   enable = true;
  # };

  xdg.configFile."sway/config".source = lib.mkForce ./config/sway;
}
