{ system }:
{ inputs, mySpecialArgs }:
confFile:
let
  tools = import ./.;
  outputs = inputs.self.outputs;
  overlays = mySpecialArgs.overlays;
  pkgs = import ./mkPkgs.nix { inherit system; } { inherit inputs overlays; };
in
inputs.home-manager.lib.homeManagerConfiguration {
  inherit pkgs;

  extraSpecialArgs = {
    inherit
      inputs
      tools
      outputs
      mySpecialArgs
      ;
  };

  modules = [
    confFile
    outputs.homeModules.default
  ];
}
