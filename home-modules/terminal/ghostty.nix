{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.terminal.ghostty.enable = lib.mkEnableOption "Enable ghostty";

  config = lib.mkIf config.bobymoby.terminal.ghostty.enable {
    home.packages = with pkgs; [
      ghostty
    ];
  };
}
