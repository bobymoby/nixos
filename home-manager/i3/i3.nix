{ ... }:

{
  # xsession.windowManager.i3 = {
  #   enable = true;
  #   # config = rec {
  #   #   modifier = "Mod4";
  #   #   bars = [ ];
  #   #   startup = [
  #   #     {
  #   #       command = "exec i3-msg workspace 1";
  #   #       always = true;
  #   #       notification = false;
  #   #     }
  #   #     {
  #   #       command = "systemctl --user restart polybar.service";
  #   #       always = true;
  #   #       notification = false;
  #   #     }
  #   #     {
  #   #       command = "${pkgs.feh}/bin/feh --bg-scale ~/background.png";
  #   #       always = true;
  #   #       notification = false;
  #   #     }
  #   #   ];
  #   # };
  # };
  home.file."./.config/i3/config".source = ./i3config;
  home.file."./.background-image".source = ./background.png;
}
