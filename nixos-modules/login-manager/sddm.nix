{ lib, config, ... }:

{
  options.bobymoby.login-manager.sddm = {
    enable = lib.mkEnableOption "Enable SDDM";
    # withX11 = lib.mkEnableOption "Enable X11";
    wayland.enable = lib.mkEnableOption "Enable Wayland";
  };

  config = lib.mkIf config.bobymoby.login-manager.sddm.enable {
    services.xserver = {
      enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = config.bobymoby.login-manager.sddm.wayland.enable;
      };
    };
  };
}
