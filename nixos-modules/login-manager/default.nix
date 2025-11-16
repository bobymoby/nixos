{
  lib,
  config,
  tools,
  ...
}:
let
  enabledLoginManagerCount = tools.enabledSubmoduleCount config.bobymoby.login-manager;
in
{
  imports = [
    ./gdm.nix
    ./lightdm.nix
    ./sddm.nix
  ];

  config = {
    assertions = [
      {
        assertion = enabledLoginManagerCount <= 1;
        message = "Only 1 login manager can be enabled at a time";
      }
    ];

    bobymoby.login-manager = {
      gdm.enable = lib.mkIf config.bobymoby.gnome.enable true;
      sddm = lib.mkIf config.bobymoby.kde.enable {
        enable = true;
        wayland.enable = true;
      };
    };
  };
}
