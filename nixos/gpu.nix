{ pkgs, config, ... }:

{
  services.xserver.videoDrivers = [ "nouveau" ];
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
}
