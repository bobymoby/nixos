{ pkgs, config, lib, ... }:

{
  options.bobymoby.windowManager.i3Gnome.enable = lib.mkEnableOption "Enable i3 with GNOME";

  config = lib.mkIf config.bobymoby.windowManager.i3Gnome.enable {
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

        desktopManager = {
          xterm.enable = false;
          gnome.enable = true;
        };

        windowManager.i3 = {
          enable = true;
          extraPackages = with pkgs; [
            dmenu
            i3lock
          ];
        };
      };
    };

    environment.gnome.excludePackages = (with pkgs; [
      gnome-photos
      gnome-tour
      gedit # text editor
      gnome-text-editor
      gnome-console
    ]) ++ (with pkgs.gnome; [
      cheese # webcam tool
      gnome-music
      gnome-terminal
      epiphany # web browser
      geary # email reader
      evince # document viewer
      gnome-characters
      totem # video player
      tali # poker game
      iagno # go game
      hitori # sudoku game
      atomix # puzzle game
      gnome-color-manager
      gnome-clocks
      gnome-contacts
      gnome-font-viewer
      gnome-logs
      gnome-maps
      gnome-weather
      nautilus
    ]);
  };
}
