{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.notifications.swaync.enable =
    lib.mkEnableOption "SwayNC notifications";

  config = lib.mkIf config.bobymoby.notifications.swaync.enable {
    home.packages = with pkgs; [ swaynotificationcenter ];
  };
}
