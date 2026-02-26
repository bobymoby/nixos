{
  lib,
  config,
  tools,
  pkgs,
  ...
}:
{
  options.bobymoby.wayland.niri = {
    enable = tools.mkEnableOption "Enable niri home module";
    # enable-dms = tools.mkEnableOption "Enable Dank Material Shell integration";
  };

  config = lib.mkIf config.bobymoby.wayland.niri.enable {
    # programs.dankMaterialShell = lib.mkIf config.bobymoby.wayland.niri.enable-dms {
    #   enable = true;
    #   niri = {
    #     enableKeybinds = true;
    #     enableSpawn = true;
    #   };
    # };
    # programs.niri = {
    #   enable = true;
    #   package = pkgs.niri-unstable;
    #   config = builtins.readFile ./config.kdl;
    # };
    home.file.".config/niri/config.kdl".source =
      config.lib.file.mkOutOfStoreSymlink "/etc/nixos/home-modules/wayland/niri/config.kdl";
    bobymoby = {
      wayland = {
        waybar = {
          enable = true;
          useLaptopConfig = true;
        };
        rofi.enable = true;
      };
      notifications.dunst.enable = true;
    };
    home.packages = with pkgs; [
      swaylock
      # fuzzel
      swaybg
      xwayland-satellite
    ];
    home.file.".gradient.png".source = ../../../assets/gradient.png;
  };
}
