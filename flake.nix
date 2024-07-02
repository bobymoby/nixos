{
  description = "Your new nix config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland = {
      type = "git";
      url = "https://github.com/hyprwm/Hyprland";
      submodules = true;
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
        BobiNixOS = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs; };
          inherit system;
          modules = [
            ./hosts/pc/configuration.nix
            ./nixos-modules
            # grub2-themes.nixosModules.default
          ];
        };
      };

      homeConfigurations = {
        #nix run .#bobymoby@laptop.activationPackage
        "bobymoby@BobiLaptopNixOS" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/laptop/home.nix
            ./home-modules
          ];
        };
        #nix run .#bobymoby@laptop.activationPackage
        "bobymoby@BobiNixOS" = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            ./hosts/pc/home.nix
            ./home-modules
          ];
        };
      };
    };
}
