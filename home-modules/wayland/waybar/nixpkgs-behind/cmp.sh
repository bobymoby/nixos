rev=$(jq -r '.nodes.nixpkgs.locked.rev' $FLAKE/flake.lock)
link="https://api.github.com/repos/NixOS/nixpkgs/compare/nixos-unstable...$rev"

curl --silent $link | jq -r '.behind_by'
