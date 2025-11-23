{
  lib,
  config,
  tools,
  ...
}:
{
  options.bobymoby.niri = {
    enable = tools.mkEnableOption "Enable niri home module";
    enable-dms = tools.mkEnableOption "Enable Dank Material Shell integration";
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
      config = ./config.kdl;
      #settings = {
      #binds = {
      #"Mod+Return".action.spawn = "kitty";
      #};
    };
  };
}
