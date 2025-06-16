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
    terminal.kitty.enable = true;

    easyeffects.enable = true;

    dev = {
      nix.enable = true;
      web.enable = true;
      integrated.enable = true;
      mobile.enable = true;
      jetbrains-tools.enable = true;
      zed.enable = true;
    };
  };

  home.packages = with pkgs; [
    # openrazer-daemon # razer mouse control
    polychromatic # razer gui
  ];
}
