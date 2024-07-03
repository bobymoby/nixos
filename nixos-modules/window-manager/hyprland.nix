{ inputs, pkgs, lib, config, ... }:

{
  options.bobymoby.windowManager.hyprland.enable = lib.mkEnableOption "Enable Hyprland with GDM";

  config = lib.mkIf config.bobymoby.windowManager.hyprland.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };

    programs.hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    };

    environment.sessionVariables.NIXOS_OZONE_WL = "1";

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
