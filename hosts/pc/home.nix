{ ... }:

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
    jetbrains.enable = false;
    easyeffects.enable = true;
    alacritty.enableDebugInfo = true;
  };
}
