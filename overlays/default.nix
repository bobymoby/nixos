{ inputs, system }:

let
  # overlay1 = import ./overlay1;
  # overlay2 = import ./overlay2;
  use-stable-electron = import ./use-stable-electron.nix {
    inherit inputs system;
  };

  overlays = [
    # use-stable-electron
    # overlay2
  ];
in
overlays
