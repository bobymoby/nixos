{ pkgs, config, ... }:
# let
# isUsingZsh = config.bobymoby.shell.zsh.enable;
# isUsingFish = config.bobymoby.shell.fish.enable;
# currentShell = if isUsingZsh then pkgs.zsh else pkgs.bash;
# in
{
  imports = [
    ./zsh.nix
    ./fish.nix
  ];
}
