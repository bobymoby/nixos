{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

let
  shouldUsePcConfig = config.bobymoby.wayland.hyprland.usePcConfig;
  shouldUseLaptopConfig = config.bobymoby.wayland.hyprland.useLaptopConfig;
  configPath =
    if shouldUsePcConfig then
      ./specific/pc
    else if shouldUseLaptopConfig then
      ./specific/laptop
    else
      null;
  enabledTerminal = builtins.elemAt (tools.getEnabledModules config.bobymoby.terminal) 0;
in
{
  options.bobymoby.wayland.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland";
    useLaptopConfig = lib.mkEnableOption "Use laptop configuration";
    usePcConfig = lib.mkEnableOption "Use PC configuration";
  };

  config = lib.mkIf config.bobymoby.wayland.hyprland.enable {
    assertions = [
      {
        assertion = !builtins.isNull configPath;
        message = "You have to specify which hyprland configuration to use";
      }
    ];
    home = {
      file = {
        ".config/hypr" = {
          source = configPath;
          recursive = true;
        };
        ".config/hypr/common" = {
          source = ./common;
          recursive = true;
        };
        ".config/hypr/common/hm.conf".text = ''
          $terminalClean = ${enabledTerminal}
        '';
        ".config/hypr/scripts" = {
          source = ./scripts;
          recursive = true;
        };
        ".config/hypr/assets" = {
          source = ./assets;
          recursive = true;
        };
        # ".config/hypr/hyprpaper.conf".source = ./extras/hyprpaper.conf;
      };

      packages = with pkgs; [
        hyprshot
        hypridle
        hyprlock
        # hyprpaper
        swww
      ];
    };
    # wayland.windowManager.hyprland = {
    #   enable = true;
    #   # plugins = with pkgs.hyprlandPlugins; [
    #   #   hy3
    #   # ];
    # };
  };
}
