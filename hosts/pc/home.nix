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
    terminal.kitty.enable = true;

    easyeffects.enable = true;
    # alacritty.debugInfo.enable = true;

    dev = {
      nix.enable = true;
      web.enable = true;
      mobile.enable = true;
      # integrated.enable = true;
      # jetbrainsTools.enable = true;
    };
  };
}
