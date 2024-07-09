{ pkgs, lib, config, ... }:

let
  shouldUsePcConfig = config.bobymoby.wayland.hyprland.usePcConfig;
  shouldUseLaptopConfig = config.bobymoby.wayland.hyprland.useLaptopConfig;
  configPath = if shouldUsePcConfig then ./specific/pc.conf else if shouldUseLaptopConfig then ./specific/laptop.conf else null;
in
{
  options.bobymoby.wayland.hyprland = {
    enable = lib.mkEnableOption "Enable Hyprland";
    useLaptopConfig = lib.mkEnableOption "Use laptop configuration";
    usePcConfig = lib.mkEnableOption "Use PC configuration";
  };

  config = lib.mkIf config.bobymoby.wayland.hyprland.enable {
    home.file = {
      ".config/hypr/common" = {
        source = ./common;
        recursive = true;
      };
      ".config/hypr/scripts" = {
        source = ./scripts;
        recursive = true;
      };
      ".config/hypr/nvidia.conf".source = ./specific/nvidia.conf;
      "./.config/hypr/hyprland.conf".source = configPath; # ./ is required
      ".config/hypr/hypridle.conf".source = ./extras/hypridle.conf;
      ".config/hypr/hyprlock.conf".source = ./extras/hyprlock.conf;
      ".config/hypr/hyprpaper.conf".source = ./extras/hyprpaper.conf;
    };

    wayland.windowManager.hyprland = {
      enable = true;
      # plugins = with pkgs.hyprlandPlugins; [
      #   hy3
      # ];
    };
  };
}
