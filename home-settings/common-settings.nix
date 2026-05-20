{ pkgs, ... }:

{
  home = rec {
    username = "bobymoby";
    homeDirectory = "/home/${username}";
  };
  programs.home-manager.enable = true;

  nix.package = pkgs.nix;

  home.stateVersion = "23.05";
}
