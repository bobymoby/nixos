{ inputs, mySpecialArgs }:
confFile:
let
  tools = import ./tools.nix;
  system = tools.systems.x86_64-linux;
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
