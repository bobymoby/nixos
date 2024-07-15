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

  config.home.packages =
    [ ]
    ++ (lib.optionals config.bobymoby.dev.nix.enable [
      pkgs.nixpkgs-fmt
      pkgs.nixfmt-rfc-style
      pkgs.nil # nix linter
    ])
    ++ (lib.optionals config.bobymoby.dev.web.enable [
      pkgs.postman
      pkgs.dbeaver-bin
    ])
    ++ (lib.optionals config.bobymoby.dev.integrated.enable [ pkgs.arduino-ide ])
    ++ (lib.optionals config.bobymoby.dev.jetbrainsTools.enable [
      pkgs.rider
      pkgs.idea-ultimate
    ]);
}
