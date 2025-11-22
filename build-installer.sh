#!/usr/bin/env bash
nix build .#nixosConfigurations.installer.config.system.build.isoImage
