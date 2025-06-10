{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.dev.nix.enable = lib.mkEnableOption "Enable Nix dev packages";

  config = lib.mkIf config.bobymoby.dev.nix.enable {
    home.packages = with pkgs; [
      nixpkgs-fmt
      nixfmt-rfc-style
      nil # nix linter
      nixfmt-tree
    ];
  };
}
