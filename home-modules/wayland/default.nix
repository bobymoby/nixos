{ lib, config, ... }:

{
  imports = [
    ./rofi-wayland-unwrapped/rofi-wayland-unwrapped.nix
    ./sway/sway.nix
    ./waybar/waybar.nix
    ./hyprland/hyprland.nix
  ];

  options.bobymoby.wayland = {
    enable = lib.mkEnableOption "Enable Wayland support";
    withSway = lib.mkEnableOption "Enable sway";
  };

  config = lib.mkIf config.bobymoby.wayland.enable {
    bobymoby.wayland = {
      waybar.enable = true;
      rofi.enable = true;
    };
  };
}
