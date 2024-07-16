{ mySpecialArgs, ... }:
let
  overlays = mySpecialArgs.overlays;
in
{
  nixpkgs = {
    inherit overlays;
    config.allowUnfree = true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
