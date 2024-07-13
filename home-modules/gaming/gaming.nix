{
  pkgs,
  lib,
  config,
  ...
}:

{
  options.bobymoby.gaming = {
    enable = lib.mkEnableOption "Enable gaming";
    withTools = lib.mkEnableOption "Enable gaming tools";
    withWine = lib.mkEnableOption "Enable wine";
  };

  config = lib.mkIf config.bobymoby.gaming.enable {
    home.packages =
      with pkgs;
      [
        mangohud
        dotnet-runtime_8
      ]
      ++ lib.optionals config.bobymoby.gaming.withWine (
        with pkgs;
        [
          wineWowPackages.full # wine
          lutris # wine prefix manager
          protonup-qt # proton installer
        ]
      )
      ++ lib.optionals config.bobymoby.gaming.withTools (
        with pkgs;
        [
          bottles # container manager
          heroic # epic games launcher
          r2modman # mod manager
        ]
      );
  };
}
