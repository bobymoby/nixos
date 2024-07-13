{ inputs }:

{
  mkSystem = import ./mkSystem.nix { inherit inputs; };
  mkHome = import ./mkHome.nix { inherit inputs; };
  systems = import ./systems.nix;
}
