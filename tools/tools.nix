let
  systems = import ./systems.nix;

  # Flake utilities
  mkHome = import ./mkHome.nix { system = systems.x86_64-linux; };
  mkSystem = import ./mkSystem.nix { system = systems.x86_64-linux; };
  mkPkgs = import ./mkPkgs.nix { system = systems.x86_64-linux; };

  # Nix lang utilities
  isZero = import ./isZero.nix;
  isSet = import ./isSet.nix;
  hasEnableOption = import ./hasEnableOption.nix;
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
      hasEnabledModules
      ;
  };
in
tools
