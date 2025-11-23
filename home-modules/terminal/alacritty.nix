{
  lib,
  config,
  tools,
  ...
}:

{
  options.bobymoby.terminal.alacritty = {
    enable = tools.mkEnableOption "Enable Alacritty";
    debugInfo.enable = tools.mkEnableOption "Enable debugging";
  };

  config = lib.mkIf config.bobymoby.terminal.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        font.size = 16;
      };
      #   package = lib.mkIf config.bobymoby.alacritty.debugInfo.enable (
      #     pkgs.alacritty.overrideAttrs (oldAttrs: {
      #     #   separateDebugInfo = true;
      #     })
      #   );
    };

    dconf.settings."org/gnome/desktop/default-applications".terminal =
      "exec alacritty";
    dconf.settings."org/cinnamon/desktop/default-applications".terminal =
      "exec alacritty";
  };
}
