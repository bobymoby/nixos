{ pkgs, ... }:

{
  # x+i3 setup
  environment.pathsToLink = [
    "/libexec"
    # "/share/zsh"
  ];
  services = {
    displayManager.defaultSession = "none+i3";

    xserver = {
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
      desktopManager.xterm.enable = false;
      desktopManager.gnome.enable = true;

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3lock
        ];
      };
    };
  };
}
