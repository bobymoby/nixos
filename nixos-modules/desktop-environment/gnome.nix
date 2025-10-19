{
  lib,
  config,
  pkgs,
  ...
}:
{
  options.bobymoby.desktop-environment.gnome.enable =
    lib.mkEnableOption "Enable GNOME";

  config = lib.mkIf config.bobymoby.desktop-environment.gnome.enable {
    services = {
      xserver.enable = true; # optional
      desktopManager.gnome.enable = true;
      gnome.games.enable = false;
      displayManager.defaultSession = "gnome";
    };
    # environment.systemPackages = [ pkgs.gnomeExtensions.appindicator  ];
    services.udev.packages = [ pkgs.gnome-settings-daemon ];
  };
}
