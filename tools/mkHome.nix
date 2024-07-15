{ inputs }:
confFile:
let
  tools = import ./tools.nix;
  systems = tools.systems;
  outputs = inputs.self.outputs;
in
inputs.home-manager.lib.homeManagerConfiguration {
  pkgs = import inputs.nixpkgs {
    system = systems.x86_64-linux;
    config = {
      allowUnfree = true;
    };
  };
  extraSpecialArgs = {
    inherit inputs tools outputs;
  };
  modules = [
    confFile
    outputs.homeModules.default
  ];
}