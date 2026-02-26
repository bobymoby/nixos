{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:

{
  options.bobymoby.desktop-environment.niri.enable = lib.mkEnableOption "Enable niri";

  config = lib.mkIf config.bobymoby.desktop-environment.niri.enable {
    # services.gnome.gnome-keyring.enable = true;
    nixpkgs.overlays = [ inputs.niri.overlays.niri ];
    programs.niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    bobymoby.systemd-services.authentication-agent.enable = true;
    # programs.xwayland.enable = true;
  };
}
