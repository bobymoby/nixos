{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    bobymoby-nix-flakes = {
      url = "github:bobymoby/nix-flakes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # grub2-themes.url = "github:vinceliuice/grub2-themes";
  };
  outputs =
    inputs:
    let
      tools = inputs.bobymoby-nix-flakes.lib.system-flake-tools { inherit inputs; };
    in
    {
      nixosModules.default = ./nixos-modules;
      nixosConfigurations = {
        BobiLaptopNixOS = tools.mkSystem ./hosts/laptop/configuration.nix;
        BobiNixOS = tools.mkSystem ./hosts/pc/configuration.nix;
      };

      homeModules.default = ./home-modules;
      homeConfigurations = {
        #nix run .#bobymoby@BobiLaptopNixOS.activationPackage
        "bobymoby@BobiLaptopNixOS" = tools.mkHome ./hosts/laptop/home.nix;
        #nix run .#bobymoby@BobiNixOS.activationPackage
        "bobymoby@BobiNixOS" = tools.mkHome ./hosts/pc/home.nix;
      };
    };
}
