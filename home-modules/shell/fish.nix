{
  lib,
  config,
  tools,
  ...
}:
# https://nixos.wiki/wiki/Fish#Setting_fish_as_your_shell
{
  options.bobymoby.shell.fish.enable = tools.mkEnableOption "Enable fish";

  config = lib.mkIf config.bobymoby.shell.fish.enable {
    programs.fish.enable = true;
  };
}
