{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.gaming = {
    enable = tools.mkEnableOption "Enable gaming";
    withTools = tools.mkEnableOption "Enable gaming tools";
    withWine = tools.mkEnableOption "Enable wine";
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
