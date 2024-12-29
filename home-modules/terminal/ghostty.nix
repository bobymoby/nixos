{
  lib,
  config,
  inputs,
  ...
}:

{
  options.bobymoby.terminal.ghostty.enable = lib.mkEnableOption "Enable ghostty";

  config = lib.mkIf config.bobymoby.terminal.ghostty.enable {
    home.packages = [
      inputs.ghostty.packages.x86_64-linux.default
    ];
  };
}
