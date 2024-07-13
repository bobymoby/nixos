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
    gaming = {
      enable = true;
      withWine = false;
      withTools = false;
    };
    jetbrains.enable = false;

    easyeffects.enable = true;
  };
}
