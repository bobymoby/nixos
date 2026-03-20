#!/usr/bin/env bash

set -euo pipefail

rev=$(jq -r '.nodes.nixpkgs.locked.rev' $FLAKE/flake.lock)
link="https://api.github.com/repos/NixOS/nixpkgs/compare/nixos-unstable...$rev"

# curl --silent $link | jq -r '.behind_by' || echo "unknown"
result=$(
  curl --silent --fail "$link" \
  | jq -r '.behind_by // empty' \
  2>/dev/null
) || true

echo "${result:-unknown}"
