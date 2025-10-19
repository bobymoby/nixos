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
  options.bobymoby.desktop-environment.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland";
    autoStart = lib.mkEnableOption "Auto-start Hyprland";
  };

  config = lib.mkIf config.bobymoby.desktop-environment.hyprland.enable {

    assertions = [
      {
        assertion =
          !(
            hasEnabledLoginManager && config.bobymoby.desktop-environment.hyprland.autoStart
          );
        message = "Hyprland auto start requires no login managers to be installed";
      }
    ];

    programs.hyprland.enable = true;

    xdg.portal.extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
    ];

    services.greetd =
      lib.mkIf config.bobymoby.desktop-environment.hyprland.autoStart
        {
          enable = true;
          settings = rec {
            default_session = {
              command = "${lib.getExe config.programs.hyprland.package}";
              user = "bobymoby";
            };
            initial_session = default_session;
          };
        };
    security.pam.services.greetd.enableGnomeKeyring =
      lib.mkIf config.bobymoby.desktop-environment.hyprland.autoStart true;

    services.xserver.displayManager.session = [
      {
        manage = "desktop";
        name = "Hyprland";
        start = ''
          ${config.programs.hyprland.package}/bin/Hyprland &
          waitPid=$!
        '';
      }
    ];
  };
}
