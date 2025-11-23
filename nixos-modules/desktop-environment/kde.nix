{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.desktop-environment.kde.enable =
    tools.mkEnableOption "Enable KDE Plasma";

  config = lib.mkIf config.bobymoby.desktop-environment.kde.enable {
    services = {
      xserver.enable = true; # optional
      desktopManager.plasma6.enable = true;
    };

    programs.kdeconnect.enable = true;

    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
      elisa
      khelpcenter
    ];

    environment.etc."opt/chrome/native-messaging-hosts/org.kde.plasma.browser_integration.json".source =
      "${pkgs.kdePackages.plasma-browser-integration}/etc/opt/chrome/native-messaging-hosts/org.kde.plasma.browser_integration.json";
  };
}
