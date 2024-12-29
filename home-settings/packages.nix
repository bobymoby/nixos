{ pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    qbittorrent
    libreoffice
    webcord-vencord
    spotify
    vlc
    # obsidian
    google-chrome
    bat
    gimp
    firefox
    gnome-calculator
    nemo
    stremio
    inputs.ghostty.packages.x86_64-linux.default
  ];
}
