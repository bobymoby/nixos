{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.easyeffects.enable = tools.mkEnableOption "Enable easyeffects";

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
