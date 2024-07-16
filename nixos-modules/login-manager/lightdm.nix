{
  lib,
  config,
  pkgs,
  mySpecialArgs,
  ...
}:

{
  options.bobymoby.loginManager.lightdm.enable = lib.mkEnableOption "Enable LightDM";

  config = lib.mkIf config.bobymoby.loginManager.lightdm.enable {
    services.xserver = {
      enable = true;
      displayManager = {
        startx.enable = true;
        lightdm = {
          enable = true;
          background = ../../assets/background.png;

          greeters.gtk = {
            cursorTheme = mySpecialArgs.pointerTheme;

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
