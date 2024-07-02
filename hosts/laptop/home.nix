{ ... }:

{
  # bobymoby.X11 = {
  #   i3.enable = true;
  #   picom.enable = true;
  #   polybar.enable = true;
  #   rofi.enable = true;
  #   libinput-gestures.enable = true;
  # };

  bobymoby.wayland = {
    enable = true;
    hyprland = {
      enable = true;
      useLaptopConfig = true;
    };
    rofi.enable = true;
  };

  # bobymoby.X11 = {
  #   enable = true;
  #   libinput-gestures.enable = true;
  # };
}
