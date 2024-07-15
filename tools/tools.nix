let
  systems = import ./systems.nix;

  mkHome = import ./mkHome.nix { system = systems.x86_64-linux; };
  mkSystem = import ./mkSystem.nix { system = systems.x86_64-linux; };
  mkPkgs = import ./mkPkgs.nix { system = systems.x86_64-linux; };

  tools = {
    inherit
      systems
      mkHome
      mkSystem
      mkPkgs
      ;
  };
in
tools
