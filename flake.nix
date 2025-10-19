{
  inputs = {
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-latest.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    niri = {
      url = "github:sodiboo/niri-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dankMaterialShell = {
      url = "github:AvengeMedia/DankMaterialShell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # lix-module = {
    #   url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.0.tar.gz";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
    # quickshell = {
    #   url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    inputs:
    let
      systems = import ./tools/systems.nix;
      system = systems.x86_64-linux;
      tools = import ./tools { inherit system; };
      overlays = import ./overlays { inherit inputs system; };
      pkgs = tools.mkPkgs {
        inherit inputs overlays;
        pkgs = inputs.nixpkgs;
      };
      pkgsStable = tools.mkPkgs {
        inherit inputs overlays;
        pkgs = inputs.nixpkgs-stable;
      };
      pkgsLatest = tools.mkPkgs {
        inherit inputs overlays;
        pkgs = inputs.nixpkgs-latest;
      };
      pointerTheme = {
        name = "Bibata-Modern-Ice";
        package = pkgs.bibata-cursors;
        size = 24;
      };
      formatter = tools.mkFormatter { inherit pkgs; };
      mySpecialArgs = {
        inherit
          pointerTheme
          overlays
          system
          pkgsStable
          pkgsLatest
          ;
      };
      mkSystem = tools.mkSystem {
        inherit inputs mySpecialArgs;
        extraModules = [
          inputs.chaotic.nixosModules.default
          #   inputs.lix-module.nixosModules.default
          inputs.niri.nixosModules.niri
        ];
      };
      mkHome = tools.mkHome {
        inherit inputs mySpecialArgs pkgs;
        extraModules = [
          inputs.chaotic.homeManagerModules.default
          inputs.plasma-manager.homeModules.plasma-manager

          inputs.niri.homeModules.niri
          inputs.dankMaterialShell.homeModules.dankMaterialShell.default
          inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
        ];
      };
    in
    {
      nixosModules.default = ./nixos-modules;
      nixosSettings.default = ./nixos-settings;
      nixosConfigurations = {
        BobiLaptopNixOS = mkSystem ./hosts/laptop/configuration.nix;
        BobiNixOS = mkSystem ./hosts/pc/configuration.nix;
      };

      homeModules.default = ./home-modules;
      homeSettings.default = ./home-settings;
      homeConfigurations = {
        "bobymoby@BobiLaptopNixOS" = mkHome ./hosts/laptop/home.nix;
        "bobymoby@BobiNixOS" = mkHome ./hosts/pc/home.nix;
      };

      formatter.${system} = formatter;
    };
}
