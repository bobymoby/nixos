{
  lib,
  config,
  pkgs,
  tools,
  ...
}:
let
  zsh-nix-shell = import ./plugins/zsh-nix-shell.nix { inherit pkgs; };
in
{
  options.bobymoby.shell.zsh.enable = tools.mkEnableOption "Enable zsh";

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
        # vi = lib.mkIf config.bobymoby.dev.neovim.enable "nvim";
        # vim = lib.mkIf config.bobymoby.dev.neovim.enable "nvim";
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

      #   initContent = lib.mkMerge [
      #     (lib.mkOrder 500 "zmodload zsh/zprof")
      #     (lib.mkOrder 1500 "zprof")
      #   ];
    };
  };
}
