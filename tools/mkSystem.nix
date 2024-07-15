{ inputs }:
confFile:
let
  tools = import ./tools.nix;
  systems = tools.systems;
  outputs = inputs.self.outputs;
in
inputs.nixpkgs.lib.nixosSystem {
  specialArgs = {
    inherit inputs tools outputs;
  };
  system = systems.x86_64-linux;
  modules = [
    confFile
    outputs.nixosModules.default
  ];
}
