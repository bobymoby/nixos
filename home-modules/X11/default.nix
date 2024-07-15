{ lib, config, ... }:

{
  imports = [
    ./i3/i3.nix
    ./picom/picom.nix
    ./polybar/polybar.nix
    ./rofi/rofi.nix
  ];

  options.bobymoby.X11 = {
    enable = lib.mkEnableOption "Enable X11 configuration";
    withi3 = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Enable i3 window manager";
    };
  };

  config = lib.mkIf config.bobymoby.X11.enable {
    bobymoby.X11 = lib.mkIf config.bobymoby.X11.withi3 {
      i3.enable = true;
      picom.enable = true;
      polybar.enable = true;
      rofi.enable = true;
    };

    home.pointerCursor.x11.enable = true;
  };
}
