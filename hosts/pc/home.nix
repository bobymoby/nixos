{
  bobymoby = {
    # wayland = {
    #   enable = true;
    #   hyprland = {
    #     enable = true;
    #     usePcConfig = true;
    #   };
    #   waybar.usePcConfig = true;
    # };
    # notifications.dunst.enable = true;

    # wayland.plasma.enable = true;
    # gnome = {
    #   enable = true;
    #   use-pc-config = true;
    # };
    kde = {
      enable = true;
      use-pc-config = true;
    };

    shell.zsh.enable = true;
    terminal.kitty.enable = true;

    easyeffects.enable = true;
    # alacritty.debugInfo.enable = true;

    dev = {
      nix.enable = true;
      web.enable = true;
      zed.enable = true;
      neovim.enable = true;
      # mobile.enable = true;
      # integrated.enable = true;
      jetbrains-tools.enable = true;
    };
  };
}
