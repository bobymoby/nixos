{
  lib,
  config,
  tools,
  ...
}:

{
  options.bobymoby.notifications.mako.enable =
    tools.mkEnableOption "Mako notifications";

  config = lib.mkIf config.bobymoby.notifications.mako.enable {
    # home.packages = with pkgs; [ mako ];
    services.mako.enable = true;
  };
}
