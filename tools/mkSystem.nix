{ system }:
{ inputs, mySpecialArgs }:
confFile:
let
  tools = import ./tools.nix;
  outputs = inputs.self.outputs;
in
inputs.nixpkgs.lib.nixosSystem {
  inherit system;

  specialArgs = {
    inherit
      inputs
      tools
      outputs
      mySpecialArgs
      ;
  };

  modules = [
    confFile
    outputs.nixosModules.default
  ];
}
