{ lib, config, pkgs, ... }:

{
  options.bobymoby.notifications.mako.enable = lib.mkEnableOption "Mako notifications";

  config = lib.mkIf config.bobymoby.notifications.mako.enable {
    # home.packages = with pkgs; [ mako ];
    services.mako.enable = true;
  };
}