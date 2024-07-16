{ config, ... }:

{
  programs.fzf = {
    enable = true;
    enableZshIntegration = config.bobymoby.shell.zsh.enable;
    enableFishIntegration = config.bobymoby.shell.fish.enable;
  };
}
