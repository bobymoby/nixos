{ pkgs, ... }:

{
  home.username = "bobymoby";
  home.homeDirectory = "/home/bobymoby";
  programs.home-manager.enable = true;

  nix.package = pkgs.nix;

  home.stateVersion = "23.05";
}
