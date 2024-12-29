{ inputs, system }:
final: prev:
let
  nixpkgs-stable = import inputs.nixpkgs-stable {
    inherit inputs system;
    config.allowUnfree = true;
  };
in
{
  electron = nixpkgs-stable.electron;
  electron_31 = nixpkgs-stable.electron_31;
}
