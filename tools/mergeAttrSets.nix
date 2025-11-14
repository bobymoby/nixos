{ lib }:
let
  inherit (lib) foldr recursiveUpdate;
in
listArrtSets: foldr recursiveUpdate { } listArrtSets
