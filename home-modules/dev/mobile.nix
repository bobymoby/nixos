{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.dev.mobile.enable = lib.mkEnableOption "Enable dev packages for mobile dev";

  config = lib.mkIf config.bobymoby.dev.mobile.enable {
    home.packages = with pkgs; [ android-studio ];
  };
}
