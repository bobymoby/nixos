{ pkgs, lib, config, ... }:

let
  shouldUsePcConfig = config.bobymoby.wayland.hyprland.usePcConfig;
  shouldUseLaptopConfig = config.bobymoby.wayland.hyprland.useLaptopConfig;
  configPath = if shouldUsePcConfig then ./pc.conf else if shouldUseLaptopConfig then ./laptop.conf else null;
in
{
  options.bobymoby.wayland.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland";
    useLaptopConfig = lib.mkEnableOption "Use laptop configuration";
    usePcConfig = lib.mkEnableOption "Use PC configuration";
  };

  config = lib.mkIf config.bobymoby.wayland.hyprland.enable {
    home.file = {
      "./.config/hypr/mocha.conf".source = ./common/mocha.conf;
      "./.config/hypr/binds.conf".source = ./common/binds.conf;
      "./.config/hypr/startup.conf".source = ./common/startup.conf;
      "./.config/hypr/input.conf".source = ./common/input.conf;
      "./.config/hypr/settings.conf".source = ./common/settings.conf;
      "./.config/hypr/common.conf".source = ./common/common.conf;
      "./.config/hypr/hyprland.conf".source = configPath;
      "./.config/hypr/hypridle.conf".source = ./extras/hypridle.conf;
      "./.config/hypr/hyprlock.conf".source = ./extras/hyprlock.conf;
      "./.config/hypr/scripts" = {
        source = ./scripts;
        recursive = true;
      };
    };

    wayland.windowManager.hyprland = {
      enable = true;
      # plugins = with pkgs.hyprlandPlugins; [
      #   hy3
      # ];
    };
  };
}
