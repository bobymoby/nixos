{ pkgs, mySpecialArgs, ... }:

{
  home.packages =
    (with pkgs; [
      qbittorrent
      libreoffice
      webcord-vencord
      spotify
      vlc
      obsidian
      bat
      gimp
      firefox
      gnome-calculator
      nemo
      nautilus
      kdePackages.dolphin
      stremio
      playerctl
    ])
    ++ (with mySpecialArgs.pkgsLatest; [
      google-chrome
    ]);
}
