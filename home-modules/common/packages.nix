{ pkgs, ... }:

{
  home.packages =
    (with pkgs; [
      qbittorrent
      libreoffice
      discord
      webcord-vencord
      spotify
      vlc
      postman
      dbeaver-bin
      arduino-ide
      cli-visualizer
      obsidian
    ])
    ++ (with pkgs.gnome; [ gnome-calculator ])
    ++ (with pkgs.cinnamon; [
      nemo # file manager
    ]);
}
