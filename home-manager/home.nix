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

    ./gtk/gtk.nix

    #terminal
    # ./command-not-found.nix # done in packages.nix
    ./zsh/zsh.nix
    ./alacritty/alacritty.nix
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
