{ mySpecialArgs, inputs, ... }:
let
  overlays = mySpecialArgs.overlays;
in
{
  nixpkgs = {
    inherit overlays;
    config.allowUnfree = true;
  };

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
  };
}
