{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.shell.zsh.enable = lib.mkEnableOption "Enable zsh";

  config = lib.mkIf config.bobymoby.shell.zsh.enable {
    home.file.".config/custom-ohmyzsh" = {
      source = ./zsh;
      recursive = true;
    };

    programs.zsh = {
      enable = true;
      # enableCompletion = true;
      shellAliases = {
        ll = "ls -l";
        la = "ls -la";
        eza = "eza --icons --hyperlink";
        cat = "bat";
      };
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell-nix";
        plugins = [
          "git"
          "sudo"
          "docker"
        ];
        custom = "$HOME/.config/custom-ohmyzsh";
      };

      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];
    };
  };
}
