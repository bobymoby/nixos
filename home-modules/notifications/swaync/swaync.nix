{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.notifications.swaync.enable =
    tools.mkEnableOption "SwayNC notifications";

  config = lib.mkIf config.bobymoby.notifications.swaync.enable {
    home.packages = with pkgs; [ swaynotificationcenter ];
  };
}
