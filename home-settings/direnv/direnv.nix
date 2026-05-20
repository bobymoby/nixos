{
  lib,
  config,
  pkgs,
  ...
}:

{
  config = {
    programs.direnv = {
      enable = true;
      enableZshIntegration = config.bobymoby.shell.zsh.enable;
      enableFishIntegration = config.bobymoby.shell.fish.enable;
      nix-direnv.enable = true;
      # git.ignores = [ ".direnv" ];
    };

    home.packages = with pkgs; [ devenv ];

    home.file.".config/direnv/direnvrc".source = ./direnvrc;
  };
}
