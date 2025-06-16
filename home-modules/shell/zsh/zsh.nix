{
  lib,
  config,
  pkgs,
  ...
}:
let 
zsh-nix-shell = import ./plugins/zsh-nix-shell.nix { inherit pkgs; };
in
{
  options.bobymoby.shell.zsh.enable = lib.mkEnableOption "Enable zsh";

  config = lib.mkIf config.bobymoby.shell.zsh.enable {
    home.file.".config/custom-ohmyzsh" = {
      source = ./.;
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
        c = "clear";
        ls = "eza --icons --hyperlink";
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
        zsh-nix-shell
      ];
    };
  };
}
