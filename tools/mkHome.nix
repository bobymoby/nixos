{ system }:
{ inputs, mySpecialArgs }:
confFile:
let
  tools = import ./tools.nix;
  outputs = inputs.self.outputs;
  pkgs = import ./mkPkgs.nix { inherit system; } { inherit inputs; };
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
