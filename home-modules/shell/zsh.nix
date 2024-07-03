{ lib, config, ... }:

{
  options.bobymoby.shell.zsh.enable = lib.mkEnableOption "Enable zsh";

  config = lib.mkIf config.bobymoby.shell.zsh.enable {
    programs.zsh = {
      enable = true;
      # enableCompletion = true;
      shellAliases = {
        ll = "ls -l";
        la = "ls -la";
        eza = "eza --icons --hyperlink";
      };
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "sudo"
          "docker"
        ];
      };
    };
  };
}
