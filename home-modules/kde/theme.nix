{
  lib,
  config,
  pkgs,
  mySpecialArgs,
  ...
}:

let
  gradient = "/home/bobymoby/.gradient.png";
in
{
  config = lib.mkIf config.bobymoby.kde.enable {
    home.file.".gradient.png".source = ../../assets/gradient.png;
    home.packages = with pkgs; [
      papirus-icon-theme
    ];

    programs.plasma = {
      kscreenlocker.appearance.wallpaper = gradient;
      workspace = {
        theme = "Dracula";
        colorScheme = "DraculaPurple";
        # lookAndFeel = "Dracula";
        cursor = {
          inherit (mySpecialArgs.pointerTheme) size;
          theme = mySpecialArgs.pointerTheme.name;
        };
        windowDecorations = {
          library = "org.kde.kwin.aurorae";
          theme = "__aurorae__svg__Dracula";
        };
        iconTheme = "Papirus-Dark";
        wallpaper = gradient;
        splashScreen.theme = "a2n.kuro";
      };
    };
  };
}
