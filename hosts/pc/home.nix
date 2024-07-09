{ ... }:

{
  bobymoby = {
    wayland = {
      enable = true;
      hyprland = {
        enable = true;
        useLaptopConfig = false;

        usePcConfig = true;
      };
      rofi.enable = true;

      withSway = false;
      wofi.enable = false;

      waybar = {
        showBattery = false;
        thermal-zone = 7;
      };
    };

    X11 = {
      enable = false;
    };

    libinput-gestures.enable = false;
    shell = {
      zsh.enable = true;
      fish.enable = false;
    };

    gaming.enable = false;
    jetbrains.enable = false;
  };
}
