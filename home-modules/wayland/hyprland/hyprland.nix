{ pkgs, lib, config, ... }:

{
  options.bobymoby.wayland.hyprland.enable = lib.mkEnableOption "Enable Hyprland";

  config = lib.mkIf config.bobymoby.wayland.hyprland.enable {
    home.file."./.config/hypr/binds.conf".source = ./binds.conf;
    home.file."./.config/hypr/startup.conf".source = ./startup.conf;
    home.file."./.config/hypr/input.conf".source = ./input.conf;
    home.file."./.config/hypr/hyprland.conf".source = ./hyprland.conf;

    wayland.windowManager.hyprland = {
      enable = true;
      # plugins = with pkgs.hyprlandPlugins; [
      #   hy3
      # ];
    };
  };
}
