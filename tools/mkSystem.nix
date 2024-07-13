{ inputs }:
confFile:
let
  tools = import ./. { inherit inputs; };
  outputs = inputs.self.outputs;
in
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs tools outputs;
  };
  system = tools.systems.x86_64-linux;
  modules = [
    confFile
    outputs.nixosModules.default
  ];
}
