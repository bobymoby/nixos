{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.dev.jetbrains-tools.enable =
    lib.mkEnableOption "Enable JetBrains tools";

  config = lib.mkIf config.bobymoby.dev.jetbrains-tools.enable {
    home.packages = with pkgs.jetbrains; [
      rider
      idea-ultimate
    ];
  };
}
