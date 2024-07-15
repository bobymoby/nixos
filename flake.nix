{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    inputs:
    let
      tools = import ./tools/tools.nix;
      mkSystem = tools.mkSystem { inherit inputs; };
      mkHome = tools.mkHome { inherit inputs; };
    in
    {
      nixosModules.default = ./nixos-modules;
      nixosConfigurations = {
        BobiLaptopNixOS = mkSystem ./hosts/laptop/configuration.nix;
        BobiNixOS = mkSystem ./hosts/pc/configuration.nix;
      };

      homeModules.default = ./home-modules;
      homeConfigurations = {
        #nix run .#bobymoby@BobiLaptopNixOS.activationPackage
        "bobymoby@BobiLaptopNixOS" = mkHome ./hosts/laptop/home.nix;
        #nix run .#bobymoby@BobiNixOS.activationPackage
        "bobymoby@BobiNixOS" = mkHome ./hosts/pc/home.nix;
      };
    };
}
