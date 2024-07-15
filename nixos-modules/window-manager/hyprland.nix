{
  pkgs,
  lib,
  config,
  ...
}:

{
  options.bobymoby.windowManager.hyprland.enable = lib.mkEnableOption "Enable Hyprland";

  config = lib.mkIf config.bobymoby.windowManager.hyprland.enable {
    programs.hyprland.enable = true;

    xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
}
