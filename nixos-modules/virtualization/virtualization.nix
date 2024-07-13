{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.virtualization.enable = lib.mkEnableOption "Enable Virtualization";

  config = lib.mkIf config.bobymoby.virtualization.enable {
    virtualisation.docker.enable = true;
    environment.systemPackages = with pkgs; [ distrobox ];
  };
}
