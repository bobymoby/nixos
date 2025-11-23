{
  lib,
  config,
  tools,
  ...
}:

{
  options.bobymoby.login-manager.sddm = {
    enable = tools.mkEnableOption "Enable SDDM";
    wayland.enable = tools.mkEnableOption "Enable Wayland";
  };

  config = lib.mkIf config.bobymoby.login-manager.sddm.enable {
    services = {
      xserver.enable = true;
      displayManager.sddm = {
        enable = true;
        wayland.enable = config.bobymoby.login-manager.sddm.wayland.enable;
        settings.General.DisplayServer = lib.mkIf config.bobymoby.login-manager.sddm.wayland.enable "wayland";
      };
    };
  };
}
