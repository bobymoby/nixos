{ pkgs, mySpecialArgs, ... }:

{
  home.packages =
    (with pkgs; [
      qbittorrent
      libreoffice
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
      #   stremio
      playerctl
      mpv
      tesseract
    ])
    ++ (with mySpecialArgs.pkgsLatest; [
      google-chrome
      #   webcord-vencord
      vesktop
    ]);
}
