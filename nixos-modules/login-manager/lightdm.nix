{
  lib,
  config,
  tools,
  mySpecialArgs,
  ...
}:

{
  options.bobymoby.login-manager.lightdm.enable =
    tools.mkEnableOption "Enable LightDM";

  config = lib.mkIf config.bobymoby.login-manager.lightdm.enable {
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
