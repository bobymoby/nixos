{
  pkgs,
  lib,
  config,
  ...
}:

{
  options.bobymoby.X11.rofi.enable = lib.mkEnableOption "Enable rofi";

  config = lib.mkIf config.bobymoby.X11.rofi.enable {
    programs.rofi = {
      enable = true;
      plugins = with pkgs; [
        rofi-calc
        rofi-emoji
        rofi-power-menu
      ];
      terminal = "${pkgs.alacritty}/bin/alacritty";
      theme = ./spotlight-dark.rasi;
      extraConfig = {
        modi = "drun,filebrowser,window";
        show-icons = true;
        # sort = true;
        # matching = "fuzzy";
      };
    };

    # for rofi-emoji to insert emojis directly
    # home.packages = [ pkgs.xdotool ];
  };

}
