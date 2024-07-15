{
  lib,
  config,
  pkgs,
  ...
}:

{
  # xprop to read window properties
  # class_i -> wm_class[0]
  # class_g -> wm_class[1]

  options.bobymoby.X11.picom.enable = lib.mkEnableOption "Enable picom compositor";

  config = lib.mkIf config.bobymoby.X11.picom.enable {
    home = {
      packages = with pkgs; [ picom ];

      file.".config/picom/picom.conf".source = ./picom.conf;
    };
  };
}
