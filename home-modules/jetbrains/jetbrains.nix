{
  pkgs,
  lib,
  config,
  ...
}:

{
  options.bobymoby.jetbrains.enable = lib.mkEnableOption "Enable JetBrains IDEs";

  config = lib.mkIf config.bobymoby.jetbrains.enable {
    home.packages = with pkgs.jetbrains; [
      rider
      idea-ultimate
    ];
  };
}
