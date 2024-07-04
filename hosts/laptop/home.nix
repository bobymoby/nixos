{ ... }:

{
  # bobymoby.X11 = {
  #   i3.enable = true;
  #   picom.enable = true;
  #   polybar.enable = true;
  #   rofi.enable = true;
  #   libinput-gestures.enable = true;
  # };

  bobymoby = {
    wayland = {
      enable = true;
      hyprland = {
        enable = true;
        useLaptopConfig = true;

        usePcConfig = false;
      };
      rofi.enable = true;

      withSway = false;
      wofi.enable = false;
    };

    X11 = {
      enable = false;
    };

    libinput-gestures.enable = true;
    shell = {
      zsh.enable = true;
      fish.enable = false;
    };

    gaming.enable = false;
    jetbrains.enable = false;
  };

  # bobymoby.X11 = {
  #   enable = true;
  #   libinput-gestures.enable = true;
  # };
}
