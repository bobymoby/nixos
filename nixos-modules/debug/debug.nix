{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.debug = {
    enable = tools.mkEnableOption "Enable debugging";
    man-pages = tools.mkEnableOption "Enable Man Pages";
  };

  config = lib.mkIf config.bobymoby.debug.enable {
    environment = {
      enableDebugInfo = true;
      systemPackages =
        with pkgs;
        [ gdb ]
        ++ (lib.optionals config.bobymoby.man-pages.enable [
          pkgs.man-pages
          pkgs.man-pages-posix
        ]);
    };
  };
}
