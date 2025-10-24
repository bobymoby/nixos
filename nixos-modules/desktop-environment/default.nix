{ lib, config, ... }:

{
  imports = [
    ./hyprland.nix
    ./i3.nix
    ./kde.nix
    ./gnome.nix
  ];

  options.bobymoby = {
    gnome.enable = lib.mkEnableOption "Enable Gnome suite";
    kde.enable = lib.mkEnableOption "Enable kde suite";
  };

  config.bobymoby.desktop-environment = {
    gnome.enable = lib.mkIf config.bobymoby.gnome.enable true;
    kde.enable = lib.mkIf config.bobymoby.kde.enable true;
  };
}
