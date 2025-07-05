{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.debug = {
    enable = lib.mkEnableOption "Enable debugging";
    man-pages = lib.mkEnableOption "Enable Man Pages";
  };

  config = lib.mkIf config.bobymoby.debug.enable {
    environment = {
      enableDebugInfo = true;
      systemPackages =
        (with pkgs; [ gdb ])
        ++ (lib.optionals config.bobymoby.debug.enable [
          man-pages
          man-pages-posix
        ]);
    };
  };
}
