{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.debug.enable = lib.mkEnableOption "Enable debugging";

  config = lib.mkIf config.bobymoby.debug.enable {
    environment = {
      enableDebugInfo = true;
      systemPackages = with pkgs; [ gdb ];
    };
  };
}
