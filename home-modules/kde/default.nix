{
  imports = [
    ./input.nix
  ];

  options.bobymoby.kde = {
    enable = lib.mkEnableOption "Enable KDE Plasma";
  };

  config.programs.plasma = lib.mkIf config.bobymoby.kde.enable {
    enable = true;
    overrideConfig = true;
  };
}
