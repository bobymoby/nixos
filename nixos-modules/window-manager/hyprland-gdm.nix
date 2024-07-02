{ lib, config, ... }:

{
  options.bobymoby.windowManager.hyprlandGdm.enable = lib.mkEnableOption "Enable Hyprland with GDM";

  config = lib.mkIf config.bobymoby.windowManager.hyprlandGdm.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };

    programs.hyprland.enable = true;

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

    xdg.portal.enable = true;
  };
}
