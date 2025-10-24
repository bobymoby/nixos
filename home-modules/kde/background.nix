{ lib, config, ... }:

{
  config = lib.mkIf config.bobymoby.kde.enable {
    home.file.".gradient.png".source = ../../assets/gradient.png;
  };
}
