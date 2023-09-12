{ pkgs, ... }:

{
  programs.nix-index = {
    enable = true;
  };
  programs.bash.initExtra = ''
    source ${pkgs.nix-index}/etc/profile.d/command-not-found.sh
  '';
  programs.command-not-found.enable = false;
}
