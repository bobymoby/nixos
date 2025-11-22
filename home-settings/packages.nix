{ pkgs, ... }:
let
  google-chrome-touchpad-overscroll = pkgs.google-chrome.override {
    commandLineArgs = "--enable-features=TouchpadOverscrollHistoryNavigation";
  };
in
{
  home.packages = with pkgs; [
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
    # tesseract
    google-chrome-touchpad-overscroll
    #   webcord-vencord
    vesktop
    ventoy-full-qt
    krita
    bitwarden-desktop
  ];
}
