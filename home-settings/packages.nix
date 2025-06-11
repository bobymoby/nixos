{ pkgs, inputs, mySpecialArgs, ... }:

let
  pkgs-latest = import inputs.nixpkgs-latest {
    inherit inputs;
    inherit (mySpecialArgs) system overlays;
    config.allowUnfree = true;
  };
in
{
  home.packages = (with pkgs; [
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
    stremio
    playerctl
  ]) ++ (with pkgs-latest; [
    google-chrome
  ]);
}
