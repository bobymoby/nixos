{ mySpecialArgs, inputs, ... }:
let
  overlays = mySpecialArgs.overlays;
in
{
  documentation.nixos.includeAllModules = true;
  nixpkgs = {
    inherit overlays;
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "qtwebengine-5.15.19"
        "ventoy-qt5-1.1.07"
      ];
    };
  };

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      warn-dirty = false;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [
        "@wheel"
      ];
      auto-optimise-store = true;
    };
  };
}
