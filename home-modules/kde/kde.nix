{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.kde = {
    enable = lib.mkEnableOption "Enable KDE Plasma";
  };

  config = lib.mkIf config.bobymoby.kde.enable {
    programs.plasma = {
      enable = true;
    };
  };
}
