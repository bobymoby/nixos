{ ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
    # git.ignores = [ ".direnv" ];
  };
}
