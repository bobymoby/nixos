{ lib, config, ... }:

{
  options.bobymoby.wayland.sway.enable = lib.mkEnableOption "Enable sway";

  config = lib.mkIf config.bobymoby.wayland.sway.enable {
    xdg.configFile."sway/config".source = lib.mkForce ./sway;
  };
}
