{
  lib,
  config,
  tools,
  ...
}:

{
  imports = [
    ./hyprland.nix
    ./i3.nix
    ./kde.nix
    ./gnome.nix
  ];

  options.bobymoby = {
    gnome.enable = tools.mkEnableOption "Enable Gnome suite";
    kde.enable = tools.mkEnableOption "Enable kde suite";
  };

  config.bobymoby.desktop-environment = {
    gnome.enable = lib.mkIf config.bobymoby.gnome.enable true;
    kde.enable = lib.mkIf config.bobymoby.kde.enable true;
  };
}
