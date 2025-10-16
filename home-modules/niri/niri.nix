{ lib, config, ... }:
{
  options.bobymoby.niri.enable = lib.mkEnableOption "Enable niri home module";

  config = lib.mkIf config.bobymoby.niri.enable {
    programs.dankMaterialShell.enable = true;
    programs.niri.enable = true;
    programs.dankMaterialShell.niri = {
      enableKeybinds = true;
      enableSpawn = true;
    };
  };
}
