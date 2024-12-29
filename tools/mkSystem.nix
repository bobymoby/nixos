{ system }:
{
  inputs,
  mySpecialArgs,
  extraModules ? [ ],
}:
confFile:
let
  tools = import ./. { inherit system; };
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
    outputs.nixosSettings.default
  ] ++ extraModules;
}
