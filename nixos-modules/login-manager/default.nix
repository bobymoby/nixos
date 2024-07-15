{ config, tools, ... }:
let
  enabledLoginManagerCount = tools.enabledSubmoduleCount config.bobymoby.loginManager;
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
  };
}
