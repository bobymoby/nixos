{ pkgs, ... }:

{
  bobymoby = {

    # gnome.enable = true;
    kde = {
      # enable = true;
      use-laptop-config = true;
    };

    # wayland.hyprland = {
    #   enable = true;
    #   useLaptopConfig = true;
    # };

    wayland = {
      # niri.enable = true;
      hyprland = {
        enable = true;
        useLaptopConfig = true;
      };
    };

    shell.zsh.enable = true;
    terminal.kitty.enable = true;

    easyeffects.enable = true;

    dev = {
      nix.enable = true;
      web.enable = true;
      neovim.enable = true;
      integrated.enable = true;
      #mobile.enable = true;
      jetbrains-tools = {
        enable = true;
        rider = false;
      };
      zed.enable = true;
    };
  };

  home.packages = with pkgs; [
    # openrazer-daemon # razer mouse control
    polychromatic # razer gui
  ];
}
