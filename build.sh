nix build --no-link .#homeConfigurations.bobymoby.activationPackage
"$(nix path-info .#homeConfigurations.bobymoby.activationPackage)"/activate