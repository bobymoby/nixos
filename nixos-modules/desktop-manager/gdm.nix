{ lib, config, ... }:

{
  options.bobymoby.desktopManager.gdm.enable = lib.mkEnableOption "Enable GDM";

  config = lib.mkIf config.bobymoby.desktopManager.gdm.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };
  };
}
