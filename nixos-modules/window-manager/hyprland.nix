{
  lib,
  config,
  pkgs,
  tools,
  ...
}:
let
  hasEnabledLoginManager = tools.hasEnabledModules config.bobymoby.loginManager;
in
{
  options.bobymoby.windowManager.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland";
    autoStart = lib.mkEnableOption "Auto-start Hyprland";
  };

  config = lib.mkIf config.bobymoby.windowManager.hyprland.enable {

    assertions = [
      {
        assertion =
          !(hasEnabledLoginManager && config.bobymoby.windowManager.hyprland.autoStart);
        message = "Hyprland auto start requires no login managers to be installed";
      }
    ];

    programs.hyprland.enable = true;

    xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

    services.greetd = lib.mkIf config.bobymoby.windowManager.hyprland.autoStart {
      enable = true;
      settings = rec {
        default_session = {
          command = "${lib.getExe config.programs.hyprland.package}";
          user = "bobymoby";
        };
        initial_session = default_session;
      };
    };
  };
}
