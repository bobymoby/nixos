{ ... }:

{

  programs.zsh = {
    enable = true;
    # enableCompletion = true;
    shellAliases = {
      ll = "ls -l";
      la = "ls -la";

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
