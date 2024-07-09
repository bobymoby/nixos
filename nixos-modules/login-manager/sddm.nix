{ lib, config, ... }:

{
  options.bobymoby.loginManager.sddm = {
    enable = lib.mkEnableOption "Enable SDDM";
    withX11 = lib.mkEnableOption "Enable X11";
    withWayland = lib.mkEnableOption "Enable Wayland";
  };

  config = lib.mkIf config.bobymoby.loginManager.sddm.enable {
    services.xserver = {
      enable = config.bobymoby.loginManager.sddm.withWayland;
      displayManager.sddm = {
        enable = true;
        wayland.enable = config.bobymoby.loginManager.sddm.withWayland;
      };
    };
  };
}
