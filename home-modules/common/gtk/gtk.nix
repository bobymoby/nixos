{ pkgs, ... }:

{
  gtk = {
    enable = true;
    # theme = {
    #   name = "Gruvbox-Dark-B";
    #   package = pkgs.gruvbox-gtk-theme;
    # };
    iconTheme = {
      name = "oomox-gruvbox-dark";
      package = pkgs.gruvbox-dark-icons-gtk;
    };
    theme = {
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
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };

  home.file.".background-image.png".source = ../../../shared/background.png;
  home.file.".background-image".source = ../../../shared/background.png;
}
