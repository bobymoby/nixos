{
  lib,
  config,
  pkgs,
  mySpecialArgs,
  ...
}:

{
  config = {
    gtk = {
      enable = true;
      # theme = {
      #   name = "Gruvbox-Dark-B";
      #   package = pkgs.gruvbox-gtk-theme;
      # };
      iconTheme = lib.mkIf (!config.bobymoby.kde.enable) {
        name = "oomox-gruvbox-dark";
        package = pkgs.gruvbox-dark-icons-gtk;
      };
      theme = lib.mkIf (!config.bobymoby.kde.enable) {
        name = "Dracula";
        package = pkgs.dracula-theme;
      };
      # iconTheme = {
      #   name = "Dracula";
      #   package = pkgs.dracula-icon-theme;
      # };

      gtk2.extraConfig = ''
        gtk-application-prefer-dark-theme = true
      '';
      gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
      gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
    };

    dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";

    home.pointerCursor = {
      gtk.enable = true;
      inherit (mySpecialArgs.pointerTheme) name package size;
    };

    home.file.".background-image.png".source = ../../assets/background.png;
    home.file.".background-image".source = ../../assets/background.png;
    home.file.".background-gif.gif".source = ../../assets/background-gif.gif;
  };
}
