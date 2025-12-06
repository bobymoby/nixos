{
  lib,
  config,
  pkgs,
  tools,
  ...
}:
{
  options.bobymoby.desktop-environment.gnome.enable = tools.mkEnableOption "Enable GNOME";

  config = lib.mkIf config.bobymoby.desktop-environment.gnome.enable {
    services = {
      xserver.enable = true; # optional
      desktopManager.gnome.enable = true;
      gnome.games.enable = false;
      displayManager.defaultSession = "gnome";
    };

    programs.kdeconnect = {
      enable = true;
      package = pkgs.gnomeExtensions.gsconnect;
    };

    services.gnome.gnome-keyring.enable = true;

    # environment.systemPackages = [ pkgs.gnomeExtensions.appindicator  ];
    services.udev.packages = [ pkgs.gnome-settings-daemon ];
  };
}
