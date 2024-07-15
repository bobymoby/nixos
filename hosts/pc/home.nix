{
  bobymoby = {
    wayland = {
      enable = true;
      hyprland = {
        enable = true;
        usePcConfig = true;
      };
      waybar.usePcConfig = true;
    };
    shell.zsh.enable = true;

    easyeffects.enable = true;
    alacritty.enableDebugInfo = true;

    dev = {
      nix.enable = true;
      # web.enable = true;
      # integrated.enable = true;
      # jetbrainsTools.enable = true;
    };
  };
}
