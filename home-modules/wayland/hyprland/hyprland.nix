{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

let
  shouldUsePcConfig = config.bobymoby.wayland.hyprland.usePcConfig;
  shouldUseLaptopConfig = config.bobymoby.wayland.hyprland.useLaptopConfig;
  configPath =
    if shouldUsePcConfig then
      ./specific/pc
    else if shouldUseLaptopConfig then
      ./specific/laptop
    else
      null;
  enabledTerminal = builtins.elemAt (tools.getEnabledModules config.bobymoby.terminal) 0;
in
{
  options.bobymoby.wayland.hyprland = {
    enable = tools.mkEnableOption "Enable Hyprland";
    useLaptopConfig = tools.mkEnableOption "Use laptop configuration";
    usePcConfig = tools.mkEnableOption "Use PC configuration";
  };

  config = lib.mkIf config.bobymoby.wayland.hyprland.enable {
    assertions = [
      {
        assertion = !builtins.isNull configPath;
        message = "You have to specify which hyprland configuration to use";
      }
    ];
    home = {
      file = {
        #     ".config/hypr" = {
        #       source = configPath;
        #       recursive = true;
        #     };
        #     ".config/hypr/common" = {
        #       source = ./common;
        #       recursive = true;
        #     };
        #     ".config/hypr/common/hm.conf".text = ''
        #       $terminalClean = ${enabledTerminal}
        #     '';
        ".config/hypr/scripts" = {
          source = ./scripts;
          recursive = true;
        };
        ".config/hypr/assets" = {
          source = ./assets;
          recursive = true;
        };
        ".config/hypr/hyprlock.conf".source = configPath + "/hyprlock.conf";
        ".config/hypr/hypridle.conf".source = configPath + "/hypridle.conf";
        ".config/hypr/mocha.conf".source = ./common/mocha.conf;
        # ".config/hypr/hyprpaper.conf".source = ./extras/hyprpaper.conf;
      };

      packages = with pkgs; [
        hyprshot
        hypridle
        hyprlock
        # hyprpaper
        swww
      ];
    };
    wayland.windowManager.hyprland = {
      enable = true;
      plugins = with pkgs.hyprlandPlugins; [
        hyprexpo
      ];

      extraConfig = ''
        source = ~/.config/hypr/mocha.conf
        $terminalClean = ${enabledTerminal}
        ${builtins.readFile ./common/hyprexpo.conf}
        ${builtins.readFile ./common/scripts.conf}

        ${builtins.readFile ./common/binds.conf}
        ${builtins.readFile ./common/input.conf}
        ${builtins.readFile ./common/settings.conf}
        ${builtins.readFile ./common/startup.conf}
      ''
      + (
        if shouldUsePcConfig then
          ''
            ${builtins.readFile ./specific/pc/hyprland.conf}
            ${builtins.readFile ./specific/pc/nvidia.conf}
          ''
        else if shouldUseLaptopConfig then
          ''
            ${builtins.readFile ./specific/laptop/hyprland.conf}
          ''
        else
          ""
      );
    };
    # wayland.windowManager.hyprland = {
    #   enable = true;
    #   # plugins = with pkgs.hyprlandPlugins; [
    #   #   hy3
    #   # ];
    # };

    bobymoby = {
      wayland = {
        waybar = {
          enable = true;
          inherit (config.bobymoby.wayland.hyprland) useLaptopConfig usePcConfig;
        };
        rofi.enable = true;
      };
      notifications.dunst.enable = true;
    };

  };
}
