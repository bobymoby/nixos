{ pkgs, ... }:

{

  imports = [
    #wayland
    # ./sway/sway.nix
    # ./rofi-wayland-unwrapped/rofi-wayland-unwrapped.nix
    # ./waybar/waybar.nix

    #xorg
    ./i3/i3.nix
    ./rofi/rofi.nix
    ./picom/picom.nix
    ./polybar/polybar.nix
    # ./i3status-rust/i3status-rust.nix

    #terminal
    # ./zsh/zsh.nix
    # ./alacritty/alacritty.nix
  ];

  home.username = "bobymoby";
  home.homeDirectory = "/home/bobymoby";

  home.packages = with pkgs; [
    htop
    killall
    gnome.gnome-software
    networkmanager_dmenu
    spotify
    gnome.adwaita-icon-theme
    gnome.gnome-system-monitor
    libreoffice
    discord
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

  programs = {
    home-manager.enable = true;
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };

  home.stateVersion = "23.05";
}
