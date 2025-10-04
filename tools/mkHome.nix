{ system }:
{
  inputs,
  pkgs,
  mySpecialArgs,
  extraModules ? [ ],
}:
confFile:
let
  tools = import ./. { inherit system; };
  outputs = inputs.self.outputs;
  # overlays = mySpecialArgs.overlays;
  # pkgs = import ./mkPkgs.nix { inherit system; } { inherit inputs overlays; };
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
    outputs.homeSettings.default
  ]
  ++ extraModules;
}
