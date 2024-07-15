{ lib, config, ... }:

{
  imports = [
    ./hyprland/hyprland.nix
    ./rofi/rofi.nix
    ./sway/sway.nix
    ./waybar/waybar.nix
    ./wofi/wofi.nix
  ];

  options.bobymoby.wayland.enable = lib.mkEnableOption "Enable Wayland support";

  config = lib.mkIf config.bobymoby.wayland.enable {
    bobymoby.wayland = {
      waybar.enable = true;
      rofi.enable = true;
    };
  };
}
