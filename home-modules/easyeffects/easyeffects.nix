{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.easyeffects.enable = lib.mkEnableOption "Enable easyeffects";

  config = lib.mkIf config.bobymoby.easyeffects.enable {
    home = {
      packages = with pkgs; [ easyeffects ];

      file.".config/easyeffects/input" = {
        source = ./presets;
        recursive = true;
      };
    };
  };
}
