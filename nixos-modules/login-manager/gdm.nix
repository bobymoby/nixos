{ lib, config, ... }:

{
  options.bobymoby.login-manager.gdm.enable = lib.mkEnableOption "Enable GDM";

  config = lib.mkIf config.bobymoby.login-manager.gdm.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };
  };
}
