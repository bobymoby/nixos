{
  lib,
  config,
  tools,
  pkgs,
  ...
}:
{
  options.bobymoby.wayland.niri = {
    enable = tools.mkEnableOption "Enable niri home module";
    enable-dms = tools.mkEnableOption "Enable Dank Material Shell integration";
  };

  config = lib.mkIf config.bobymoby.wayland.niri.enable {
    programs.dankMaterialShell = lib.mkIf config.bobymoby.wayland.niri.enable-dms {
      enable = true;
      niri = {
        enableKeybinds = true;
        enableSpawn = true;
      };
    };
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
      config = builtins.readFile ./config.kdl;
      #settings = {
      #binds = {
      #"Mod+Return".action.spawn = "kitty";
      #};
    };
    bobymoby = {
      wayland = {
        waybar = {
          enable = true;
          useLaptopConfig = true;
        };
        rofi.enable = true;
      };
    };
    home.packages = with pkgs; [
      swaylock
    ];
  };
}
