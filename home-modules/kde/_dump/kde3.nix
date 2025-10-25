{
  programs.plasma = {
    enable = true;
    shortcuts = {
      "services/org.kde.krunner.desktop"."RunClipboard" = "Meta+Shift+Space";
      "services/org.kde.krunner.desktop"."_launch" = "Meta+Space";
    };
    configFile = {
      "kcminputrc"."Keyboard"."NumLock" = 1;
      "kcminputrc"."Libinput/1267/12670/DELL0A71:00 04F3:317E Touchpad"."NaturalScroll" =
        true;
      "kcminputrc"."Libinput/1267/12670/DELL0A71:00 04F3:317E Touchpad"."PointerAccelerationProfile" =
        2;
      "kcminputrc"."Mouse"."cursorSize" = 24;
      "kcminputrc"."Mouse"."cursorTheme" = "Bibata-Modern-Ice";
      "kdeglobals"."General"."TerminalApplication" = "kitty";
      "kdeglobals"."General"."TerminalService" = "kitty.desktop";
      "krunnerrc"."General"."ActivateWhenTypingOnDesktop" = false;
      "krunnerrc"."General"."FreeFloating" = true;
      "kscreenlockerrc"."Greeter"."WallpaperPlugin" = "org.kde.image";
      "kscreenlockerrc"."Greeter/Wallpaper/org.kde.image/General"."Image" =
        "/home/bobymoby/.gradient.png";
      "ksmserverrc"."General"."confirmLogout" = false;
      "ksmserverrc"."General"."loginMode" = "emptySession";
      "ksplashrc"."KSplash"."Theme" = "a2n.kuro";
      "kwinrc"."Desktops"."Id_1" = "Desktop_1";
      "kwinrc"."Desktops"."Id_2" = "Desktop_2";
      "kwinrc"."Desktops"."Id_3" = "Desktop_3";
      "kwinrc"."Desktops"."Id_4" = "Desktop_4";
      "kwinrc"."Desktops"."Id_5" = "Desktop_5";
      "kwinrc"."Desktops"."Number" = 5;
      "kwinrc"."Desktops"."Rows" = 1;
      "kwinrc"."TabBox"."ActivitiesMode" = 0;
      "kwinrc"."TabBox"."DesktopMode" = 0;
      "kwinrc"."TabBox"."HighlightWindows" = false;
      "kwinrc"."TabBox"."LayoutName" = "compact";
      "kwinrc"."org.kde.kdecoration2"."BorderSize" = "None";
      "kwinrc"."org.kde.kdecoration2"."BorderSizeAuto" = false;
      "kwinrc"."org.kde.kdecoration2"."theme" = "__aurorae__svg__Dracula";
      "kxkbrc"."Layout"."DisplayNames" = ",";
      "kxkbrc"."Layout"."LayoutList" = "us,bg";
      "kxkbrc"."Layout"."Use" = true;
      "kxkbrc"."Layout"."VariantList" = ",phonetic";
      "plasmarc"."Theme"."name" = "Dracula";
      "spectaclerc"."Annotations"."annotationToolType" = 11;
      "spectaclerc"."ImageSave"."translatedScreenshotsFolder" = "Screenshots";
      "spectaclerc"."VideoSave"."translatedScreencastsFolder" = "Screencasts";
    };
    dataFile = {

    };
  };
}
