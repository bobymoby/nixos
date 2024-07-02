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
    home.file."./.config/hypr/binds.conf".source = ./common/binds.conf;
    home.file."./.config/hypr/startup.conf".source = ./common/startup.conf;
    home.file."./.config/hypr/input.conf".source = ./common/input.conf;
    home.file."./.config/hypr/settings.conf".source = ./common/settings.conf;
    home.file."./.config/hypr/disable-animations.sh".source = ./common/disable-animations.sh;

    home.file."./.config/hypr/common.conf".source = ./common/common.conf;

    home.file."./.config/hypr/hyprland.conf".source = configPath;

    wayland.windowManager.hyprland = {
      enable = true;
      # plugins = with pkgs.hyprlandPlugins; [
      #   hy3
      # ];
    };
  };
}
