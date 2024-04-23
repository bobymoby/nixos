{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # grub2-themes.url = "github:vinceliuice/grub2-themes";
  };
  outputs =
    inputs@{ nixpkgs
    , home-manager
      # , grub2-themes
    , ...
    }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        BobiLaptopNixOS = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = [
            ./hosts/laptop/configuration.nix
            ./nixos-modules
            # grub2-themes.nixosModules.default
          ];
        };
      };
      homeConfigurations = {
        bobymoby = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./home-manager/home.nix
          ];
        };
      };
    };
}
