{ pkgs, ... }:

{
  bobymoby = {
    # wayland = {
    #   enable = true;
    #   waybar.enable = true;
    #   rofi.enable = true;
    #   hyprland = {
    #     enable = true;
    #     useLaptopConfig = true;
    #   };

    #   waybar.useLaptopConfig = true;
    # };

    # notifications.dunst.enable = true;

    gnome.enable = true;
    # niri.enable = true;

    # libinput-gestures.enable = true;

    shell.zsh.enable = true;
    terminal.kitty.enable = true;

    easyeffects.enable = true;

    dev = {
      nix.enable = true;
      web.enable = true;
      neovim.enable = true;
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
