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
      overlays = import ./overlays;
      pkgs = tools.mkPkgs { inherit inputs overlays; };
      pointerTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };
      mkSystem = tools.mkSystem {
        inherit inputs;
        mySpecialArgs = {
          inherit pointerTheme overlays;
        };
      };
      mkHome = tools.mkHome {
        inherit inputs;
        mySpecialArgs = {
          inherit pointerTheme overlays;
        };
      };
    in
    {
      nixosModules.default = ./nixos-modules;
      nixosConfigurations = {
        BobiLaptopNixOS = mkSystem ./hosts/laptop/configuration.nix;
        BobiNixOS = mkSystem ./hosts/pc/configuration.nix;
      };

      homeModules.default = ./home-modules;
      homeConfigurations = {
        "bobymoby@BobiLaptopNixOS" = mkHome ./hosts/laptop/home.nix;
        "bobymoby@BobiNixOS" = mkHome ./hosts/pc/home.nix;
      };
    };
}
