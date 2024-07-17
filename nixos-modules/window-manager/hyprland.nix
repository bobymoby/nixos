{
  lib,
  config,
  pkgs,
  tools,
  ...
}:
let
  hasEnabledLoginManager = tools.hasEnabledModules config.bobymoby.login-manager;
in
{
  options.bobymoby.window-manager.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland";
    autoStart = lib.mkEnableOption "Auto-start Hyprland";
  };

  config = lib.mkIf config.bobymoby.window-manager.hyprland.enable {

    assertions = [
      {
        assertion =
          !(hasEnabledLoginManager && config.bobymoby.window-manager.hyprland.autoStart);
        message = "Hyprland auto start requires no login managers to be installed";
      }
    ];

    programs.hyprland.enable = true;

    xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];

    services.greetd = lib.mkIf config.bobymoby.window-manager.hyprland.autoStart {
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
