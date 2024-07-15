{ pkgs, ... }:

{
  bobymoby = {
    wayland = {
      enable = true;
      hyprland = {
        enable = true;
        useLaptopConfig = true;
      };

      waybar.useLaptopConfig = true;
    };

    libinput-gestures.enable = true;
    shell.zsh.enable = true;

    jetbrains.enable = false;

    easyeffects.enable = true;
  };

  home.packages = with pkgs; [
    openrazer-daemon # razer mouse control
    polychromatic # razer gui
  ];
}
