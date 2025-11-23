{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  # programs.wofi.enable = true;
  options.bobymoby.wayland.wofi.enable = tools.mkEnableOption "Enable wofi";

  config = lib.mkIf config.bobymoby.wayland.wofi.enable {
    home = {
      file = {
        ".config/wofi/config".source = ./wofi;
        ".config/wofi/style.css".source = ./style.css;
      };
      packages = with pkgs; [ wofi ];
    };
  };
}
