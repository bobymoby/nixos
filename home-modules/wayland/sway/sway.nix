{
  lib,
  config,
  tools,
  ...
}:

{
  options.bobymoby.wayland.sway.enable = tools.mkEnableOption "Enable sway";

  config = lib.mkIf config.bobymoby.wayland.sway.enable {
    xdg.configFile."sway/config".source = lib.mkForce ./sway;
  };
}
