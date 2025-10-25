{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.desktop-environment.kde.enable =
    lib.mkEnableOption "Enable KDE Plasma";

  config = lib.mkIf config.bobymoby.desktop-environment.kde.enable {
    services = {
      xserver.enable = true; # optional
      desktopManager.plasma6.enable = true;
    };

    programs.kdeconnect.enable = true;

    environment.etc."opt/chrome/native-messaging-hosts/org.kde.plasma.browser_integration.json".source =
      "${pkgs.kdePackages.plasma-browser-integration}/etc/opt/chrome/native-messaging-hosts/org.kde.plasma.browser_integration.json";
  };
}
