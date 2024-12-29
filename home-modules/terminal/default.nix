{ config, tools, ... }:
let
  enabledTerminalCount = tools.enabledSubmoduleCount config.bobymoby.terminal;
in
{
  imports = [
    ./alacritty.nix
    ./kitty.nix
    ./ghostty.nix
  ];

  config = {
    assertions = [
      {
        assertion = enabledTerminalCount <= 1;
        message = "Only 1 terminal can be enabled at a time";
      }
    ];
  };
}
