{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.terminal.ghostty.enable =
    tools.mkEnableOption "Enable ghostty";

  config = lib.mkIf config.bobymoby.terminal.ghostty.enable {
    home.packages = with pkgs; [
      ghostty
    ];
  };
}
