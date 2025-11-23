{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.dev.integrated.enable =
    tools.mkEnableOption "Enable integrated dev packages";

  config = lib.mkIf config.bobymoby.dev.integrated.enable {
    home.packages = with pkgs; [ arduino-ide ];
  };
}
