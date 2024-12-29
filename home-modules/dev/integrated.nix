{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.dev.integrated.enable =
    lib.mkEnableOption "Enable integrated dev packages";

  config = lib.mkIf config.bobymoby.dev.integrated.enable {
    home.packages = with pkgs; [ arduino-ide ];
  };
}
