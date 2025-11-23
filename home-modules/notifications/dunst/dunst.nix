{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

let
  iconPath = "${pkgs.gruvbox-dark-icons-gtk}/share/icons/oomox-gruvbox-dark/16x16/status/:${pkgs.gruvbox-dark-icons-gtk}/share/icons/oomox-gruvbox-dark/16x16/devices/";
in
{
  options.bobymoby.notifications.dunst.enable =
    tools.mkEnableOption "Dunst notification daemon";
  config = lib.mkIf config.bobymoby.notifications.dunst.enable {
    home = {
      packages = with pkgs; [ dunst ];
      file = {
        ".config/dunst/dunstrc".text = ''
          [global]
          icon_path = ${iconPath}
        ''
        + builtins.readFile ./dunst.conf;
      };
    };
  };
}
