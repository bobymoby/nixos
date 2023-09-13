{ ... }:

{

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
}
