{ lib, config, ... }:

{
  options.bobymoby.loginManager.gdm.enable = lib.mkEnableOption "Enable GDM";

  config = lib.mkIf config.bobymoby.loginManager.gdm.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };
  };
}
