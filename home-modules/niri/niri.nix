{ lib, config, ... }:
{
  options.bobymoby.niri = {
    enable = lib.mkEnableOption "Enable niri home module";
    enable-dms = lib.mkEnableOption "Enable Dank Material Shell integration";
  };

  config = lib.mkIf config.bobymoby.niri.enable {
    programs.dankMaterialShell = lib.mkIf config.bobymoby.niri.enable-dms {
      enable = true;
      niri = {
        enableKeybinds = true;
        enableSpawn = true;
      };
    };
    programs.niri = {
      enable = true;
      settings = {
        binds = {
            "Mod+Return".action.spawn = "kitty";
        };
      };
    };
  };
}
