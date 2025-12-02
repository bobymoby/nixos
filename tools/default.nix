{ system, lib }:
let
  systems = import ./systems.nix;

  # Flake utilities
  mkHome = import ./mkHome.nix { inherit system lib; };
  mkSystem = import ./mkSystem.nix { inherit system lib; };
  mkPkgs = import ./mkPkgs.nix { inherit system; };
  mkFormatter = import ./mkFormatter.nix;

  mkEnableOption = import ./mkEnableOption.nix { inherit lib; };

  # Nix lang utilities
  isZero = import ./isZero.nix;
  isSet = import ./isSet.nix;
  hasEnableOption = import ./hasEnableOption.nix;
  enabledSubmoduleCount = import ./enabledSubmoduleCount.nix;
  hasEnabledModules = import ./hasEnabledModules.nix;
  getEnabledModules = import ./getEnabledModules.nix;
  mergeAttrSets = import ./mergeAttrSets.nix { inherit lib; };
  enabledAttrsToList = import ./enabledAttrsToList.nix { inherit lib; };
  listToPackageSet = import ./listToPackageSet.nix;

  tools = {
    inherit
      systems
      mkHome
      mkSystem
      mkPkgs
      mkFormatter

      mkEnableOption

      isZero
      isSet
      hasEnableOption
      enabledSubmoduleCount
      hasEnabledModules
      getEnabledModules
      mergeAttrSets
      enabledAttrsToList
      listToPackageSet
      ;
  };
in
tools
