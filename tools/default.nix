{ system }:
let
  systems = import ./systems.nix;

  # Flake utilities
  mkHome = import ./mkHome.nix { inherit system; };
  mkSystem = import ./mkSystem.nix { inherit system; };
  mkPkgs = import ./mkPkgs.nix { inherit system; };
  mkFormatter = import ./mkFormatter.nix;

  # Nix lang utilities
  isZero = import ./isZero.nix;
  isSet = import ./isSet.nix;
  hasEnableOption = import ./hasEnableOption.nix;
  enabledSubmoduleCount = import ./enabledSubmoduleCount.nix;
  hasEnabledModules = import ./hasEnabledModules.nix;
  getEnabledModules = import ./getEnabledModules.nix;

  tools = {
    inherit
      systems
      mkHome
      mkSystem
      mkPkgs
      mkFormatter
      isZero
      isSet
      hasEnableOption
      enabledSubmoduleCount
      hasEnabledModules
      getEnabledModules
      ;
  };
in
tools
