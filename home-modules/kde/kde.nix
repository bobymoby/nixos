{
  lib,
  config,
  pkgs,
  tools,
  mySpecialArgs,
  ...
}:

{
  options.bobymoby.kde = {
    enable = lib.mkEnableOption "Enable KDE Plasma";
  };

  config = lib.mkIf config.bobymoby.kde.enable {
    home.file.".gradient.png".source = ../../assets/gradient.png;

    programs.plasma = {
      enable = true;
      overrideConfig = true;
      input = {
        keyboard = {
          layouts = [
            {
              layout = "us";
              # variant = "intl";
            }
            {
              layout = "bg";
              variant = "phonetic";
            }
          ];
          numlockOnStartup = "off";
        };
        touchpads = [
          {
            name = "DELL0A71:00 04F3:317E Touchpad";
            naturalScroll = true;
            productId = "317e";
            vendorId = "04f3";
          }
        ];
      };

      kscreenlocker.appearance.wallpaper = "/home/bobymoby/.gradient.png";

      krunner = {
        activateWhenTypingOnDesktop = false;
        position = "center";
        shortcuts = {
          launch = "Meta+Space";
          runCommandOnClipboard = "Meta+Shift+Space";
        };
      };

      workspace = {
        theme = "Dracula";
        colorScheme = "DraculaPurple";
        # lookAndFeel = "Dracula";
        cursor = {
          inherit (mySpecialArgs.pointerTheme) size;
          theme = mySpecialArgs.pointerTheme.name;
        };
        wallpaper = "/home/bobymoby/.gradient.png";
        windowDecorations = {
          library = "org.kde.kwin.aurorae";
          theme = "__aurorae__svg__Dracula";
        };
      };

      kwin = {
        virtualDesktops = {
          number = 5;
          rows = 1;
        };
      };

      session = {
        general.askForConfirmationOnLogout = false;
        sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };

      configFile = {
        kwinrc = {
          "org.kde.kdecoration2" = {
            BorderSize = "None";
            BorderSizeAuto = false;
          };
          TabBox = {
            ActivitiesMode = 0;
            DesktopMode = 0;
            LayoutName = "compact";
            HighlightWindows = false;
          };
        };
      };
    };

    services.gpg-agent = {
      pinentry.package = lib.mkForce pkgs.kwalletcli;
      extraConfig = "pinentry-program ${pkgs.kwalletcli}/bin/pinentry-kwallet";
    };
  };
}
