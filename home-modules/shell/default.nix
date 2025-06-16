{ config, tools, ... }:
let
  enabledShellCount = tools.enabledSubmoduleCount config.bobymoby.shell;
in
{
  imports = [
    ./fish.nix
    ./zsh/zsh.nix
  ];

  config = {
    assertions = [
      {
        assertion = enabledShellCount <= 1;
        message = "Only 1 shell can be enabled at a time";
      }
    ];
  };
}
