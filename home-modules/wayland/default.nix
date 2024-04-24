{ lib, config, ... }:

{
  imports = [
    ./rofi-wayland-unwrapped/rofi-wayland-unwrapped.nix
    ./sway/sway.nix
    ./waybar/waybar.nix
  ];

  options.bobymoby.wayland.enable = lib.mkEnableOption "Enable Wayland support";

  config = lib.mkIf config.bobymoby.wayland.enable {
    bobymoby.wayland = {
      sway.enable = true;
      waybar.enable = true;
      rofi.enable = true;
    };
  };
}
