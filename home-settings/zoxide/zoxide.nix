{ config, ... }:

{
  config.programs.zoxide = {
    enable = true;
    enableZshIntegration = config.bobymoby.shell.zsh.enable;
    enableFishIntegration = config.bobymoby.shell.fish.enable;
    options = [
      "--cmd cd"
    ];
  };
}
