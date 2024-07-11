{ pkgs, ... }:

{
  home.packages =
    (with pkgs; [
      openrazer-daemon # razer mouse control
      polychromatic # razer gui
      qbittorrent
      cinnamon.nemo # file manager
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
    ++ (with pkgs.gnome; [ gnome-calculator ]);
}
