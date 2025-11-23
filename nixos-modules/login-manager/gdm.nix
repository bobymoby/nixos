{
  lib,
  config,
  tools,
  ...
}:

{
  options.bobymoby.login-manager.gdm.enable = tools.mkEnableOption "Enable GDM";

  config = lib.mkIf config.bobymoby.login-manager.gdm.enable {
    services = {
      xserver.enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
}
