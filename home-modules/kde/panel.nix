{ lib, config, ... }:

{
  config.programs.plasma = lib.mkIf config.bobymoby.kde.enable {
    panels = [
      {
        height = 50;
        floating = false;
        opacity = "opaque";
        screen = "all";
        widgets = [
          {
            name = "org.kde.plasma.kickoff";
            # config.General.icon = "distributor-logo-nixos";
            config.General.icon = "nix-snowflake-white";
          }
          {
            # name = "org.kde.plasma.icontasks";
            iconTasks = {
              launchers = [
                "preferred://browser"
                "applications:spotify.desktop"
                "applications:vesktop.desktop"
                "applications:code.desktop"
                "applications:idea-ultimate.desktop"
              ];
              appearance = {
                indicateAudioStreams = false;
                iconSpacing = "small";
              };
              behavior = {
                showTasks = {
                  onlyInCurrentScreen = false;
                  onlyInCurrentDesktop = false;
                  onlyInCurrentActivity = false;
                  onlyMinimized = false;
                };
              };
            };
          }
          {
            name = "org.kde.plasma.marginsseparator";
          }
          {
            # systemTray = {
            #   items = {
            #     shown = [
            #       "org.kde.plasma.keyboardlayout"
            #       "org.kde.plasma.volume"
            #       "org.kde.plasma.battery"
            #       "org.kde.plasma.weather"
            #     ];
            #     hidden = [
            #       "org.kde.plasma.bluetooth"
            #       "org.kde.plasma.networkmanagement"
            #       "org.kde.plasma.clipboard"
            #       "polychromatic-tray-applet"
            #       "org.kde.plasma.brightness"
            #     ];
            #     configs = {
            #       #   battery.showPercentage = true;
            #       "org.kde.plasma.battery".config.General.showPercentage = true;
            #       "org.kde.plasma.weather".config = {
            #         Units = {
            #           pressureUnit = 5022;
            #           speedUnit = 9001;
            #           temperatureUnit = 6001;
            #           visibilityUnit = 2007;
            #         };
            #         WeatherStation = {
            #           placeDisplayName = "Sofia, Bulgaria, BG";
            #           placeInfo = "Sofia, Bulgaria, BG|727011";
            #           provider = "bbcukmet";
            #         };
            #       };
            #     };
            #   };
            # };
            name = "org.kde.plasma.systemtray";
            config.General = {
              extraItems = "org.kde.plasma.cameraindicator,org.kde.plasma.manage-inputmethod,org.kde.plasma.clipboard,org.kde.kdeconnect,org.kde.plasma.keyboardlayout,org.kde.plasma.bluetooth,org.kde.plasma.devicenotifier,org.kde.plasma.notifications,org.kde.plasma.mediacontroller,org.kde.plasma.volume,org.kde.kscreen,org.kde.plasma.networkmanagement,org.kde.plasma.brightness,org.kde.plasma.battery,org.kde.plasma.weather,org.kde.plasma.keyboardindicator";
              hiddenItems = "org.kde.plasma.battery,org.kde.plasma.bluetooth,org.kde.plasma.networkmanagement,org.kde.plasma.clipboard,polychromatic-tray-applet,org.kde.plasma.brightness";
              shownItems = "org.kde.plasma.keyboardlayout,org.kde.plasma.volume";
            };
          }
          {
            name = "org.kde.plasma.weather";
            config = {
              Units = {
                pressureUnit = 5022;
                speedUnit = 9001;
                temperatureUnit = 6001;
                visibilityUnit = 2007;
              };
              WeatherStation = {
                placeDisplayName = "Sofia, Bulgaria, BG";
                placeInfo = "Sofia, Bulgaria, BG|727011";
                provider = "bbcukmet";
              };
            };
          }
          {
            name = "org.kde.plasma.battery";
            config.General.showPercentage = true;
          }
          {
            digitalClock = {
              time.format = "24h";
            };
          }
        ];
      }
    ];
  };
}
