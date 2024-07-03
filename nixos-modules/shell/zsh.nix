{ pkgs, lib, config, ... }:

{
  options.bobymoby.shell.zsh.enable = lib.mkEnableOption "Enable zsh";

  config = lib.mkIf config.bobymoby.shell.zsh.enable {
    users.defaultUserShell = pkgs.zsh;
    environment.shells = with pkgs; [ zsh ];
  };
}
