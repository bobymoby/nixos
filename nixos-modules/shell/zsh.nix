{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.shell.zsh.enable = lib.mkEnableOption "Enable zsh";

  config = lib.mkIf config.bobymoby.shell.zsh.enable {
    programs.zsh.enable = true;
    users.defaultUserShell = pkgs.zsh;
    environment.shells = [ pkgs.zsh ];

    environment.pathsToLink = [ "/share/zsh" ];
  };
}
