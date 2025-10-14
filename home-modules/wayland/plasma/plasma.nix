{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.wayland.plasma = {
    enable = lib.mkEnableOption "Enable Plasma6";
  };

  config = lib.mkIf config.bobymoby.wayland.plasma.enable {
    programs.plasma = {
      enable = true;
    };
  };
}
