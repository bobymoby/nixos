{ lib, config, ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntegration = lib.mkIf config.bobymoby.shell.zsh.enable true;
    enableFishIntegration = lib.mkIf config.bobymoby.shell.fish.enable true;
    nix-direnv.enable = true;
    # git.ignores = [ ".direnv" ];
  };
}
