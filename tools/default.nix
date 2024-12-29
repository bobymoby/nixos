{ system }:
let
  systems = import ./systems.nix;

  # Flake utilities
  mkHome = import ./mkHome.nix { inherit system; };
  mkSystem = import ./mkSystem.nix { inherit system; };
  mkPkgs = import ./mkPkgs.nix { inherit system; };

  # Nix lang utilities
  isZero = import ./isZero.nix;
  isSet = import ./isSet.nix;
  hasEnableOption = import ./hasEnableOption.nix;
  enabledSubmoduleCount = import ./enabledSubmoduleCount.nix;
  hasEnabledModules = import ./hasEnabledModules.nix;

  tools = {
    inherit
      systems
      mkHome
      mkSystem
      mkPkgs
      isZero
      isSet
      hasEnableOption
      enabledSubmoduleCount
      hasEnabledModules
      ;
  };
in
tools
