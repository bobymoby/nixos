{ lib, config, ... }:

{
  options.bobymoby.loginManager.sddm = {
    enable = lib.mkEnableOption "Enable SDDM";
    # withX11 = lib.mkEnableOption "Enable X11";
    wayland.enable = lib.mkEnableOption "Enable Wayland";
  };

  config = lib.mkIf config.bobymoby.loginManager.sddm.enable {
    services.xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = config.bobymoby.loginManager.sddm.wayland.enable;
      };
    };
  };
}
