{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.alacritty.debugInfo.enable =
    lib.mkEnableOption "Enable debugging";

  config = {
    programs.alacritty = {
      enable = true;
      settings = {
        font.size = 16;
      };
      package = lib.mkIf config.bobymoby.alacritty.debugInfo.enable (
        pkgs.alacritty.overrideAttrs (oldAttrs: {
          separateDebugInfo = true;
        })
      );
    };

    dconf.settings."org/gnome/desktop/default-applications".terminal =
      "exec alacritty";
    dconf.settings."org/cinnamon/desktop/default-applications".terminal =
      "exec alacritty";
  };
}
