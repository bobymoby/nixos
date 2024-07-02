{ lib, config, ... }:

{
  options.bobymoby.wayland.wofi.enable = lib.mkEnableOption "Enable wofi";

  config = lib.mkIf config.bobymoby.wayland.wofi.enable {
    programs.wofi.enable = true;

    home.file."./.config/wofi/config".source = ./wofi;
    home.file."./.config/wofi/style.css".source = ./style.css;
  };
}
