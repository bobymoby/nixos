{ pkgs, lib, config, ... }:

{
  options.bobymoby.gaming.enable = lib.mkEnableOption "Enable gaming";

  config = lib.mkIf config.bobymoby.gaming.enable {
    home.packages = with pkgs; [
      wineWowPackages.full # wine
      lutris # wine prefix manager
      protonup-qt # proton installer
      bottles # container manager
      heroic # epic games launcher
      r2modman # mod manager
    ];
  };
}
