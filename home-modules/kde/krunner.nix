{ lib, config, ... }:

{
  programs.plasma.krunner = lib.mkIf config.bobymoby.kde.enable {
    activateWhenTypingOnDesktop = false;
    position = "center";
    shortcuts = {
      launch = "Meta+Space";
      runCommandOnClipboard = "Meta+Shift+Space";
    };
  };
}
