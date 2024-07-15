{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.dev = {
    nix.enable = lib.mkEnableOption "Enable Nix dev packages";
    web.enable = lib.mkEnableOption "Enable web dev packages";
    integrated.enable = lib.mkEnableOption "Enable integrated dev packages";
    jetbrainsTools.enable = lib.mkEnableOption "Enable JetBrains tools";
  };

  config = {
    home.packages =
      [ ]
      ++ lib.optionals config.bobymoby.dev.nix.enable (
        with pkgs;
        [
          nixpkgs-fmt
          nixfmt-rfc-style
          nil # nix linter
        ]
      )
      ++ lib.optionals config.bobymoby.dev.web.enable (
        with pkgs;
        [
          postman
          dbeaver-bin
        ]
      )
      ++ lib.optionals config.bobymoby.dev.integrated.enable (
        with pkgs; [ arduino-ide ]
      )
      ++ lib.optionals config.bobymoby.dev.jetbrainsTools.enable (
        with pkgs;
        [
          rider
          idea-ultimate
        ]
      );
  };
}
