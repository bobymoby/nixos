{ lib, config, ... }:
{
  options.bobymoby.desktop-environment.kde.enable =
    lib.mkEnableOption "Enable KDE Plasma";

  config = lib.mkIf config.bobymoby.desktop-environment.kde.enable {
    services = {
      xserver.enable = true; # optional
      desktopManager.plasma6.enable = true;
    };
  };
}
