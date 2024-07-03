{ inputs, pkgs, lib, config, ... }:

{
  options.bobymoby.windowManager.hyprland.enable = lib.mkEnableOption "Enable Hyprland";

  config = lib.mkIf config.bobymoby.windowManager.hyprland.enable {
    programs.hyprland.enable = true;

    xdg.portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
      ];
    };

    environment.systemPackages = with pkgs; [
      hyprshot
      swww
      hypridle
      hyprlock
    ];
  };
}
