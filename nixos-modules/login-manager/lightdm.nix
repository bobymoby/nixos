{
  pkgs,
  lib,
  config,
  ...
}:

{
  #WIP move config to home manager
  options.bobymoby.loginManager.lightdm.enable = lib.mkEnableOption "Enable LightDM";

  config = lib.mkIf config.bobymoby.loginManager.lightdm.enable {
    services.xserver = {
      enable = true;
      displayManager = {
        startx.enable = true;
        lightdm = {
          enable = true;
          background = ../../shared/background.png;

          greeters.gtk = {
            cursorTheme = {
              name = "Bibata-Modern-Ice";
              package = pkgs.bibata-cursors;
              size = 24;
            };

            indicators = [
              "~session"
              "~spacer"
              "~clock"
              "~spacer"
              "~language"
              "~power"
            ];
          };
        };
      };
    };
  };
}
