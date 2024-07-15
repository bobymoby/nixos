{
  inputs,
  pkgs,
  mySpecialArgs,
}:
confFile:
let
  tools = import ./tools.nix;
  outputs = inputs.self.outputs;
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
