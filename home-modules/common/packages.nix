{ pkgs, ... }:

{
  home.packages =
    (with pkgs; [
      qbittorrent
      libreoffice
      webcord-vencord
      spotify
      vlc
      obsidian
      google-chrome
      bat
      # firefox
    ])
    ++ (with pkgs.gnome; [ gnome-calculator ])
    ++ (with pkgs.cinnamon; [
      nemo # file manager
    ]);
}
