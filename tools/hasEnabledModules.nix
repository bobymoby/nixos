attrSet:
let
  isZero = import ./isZero.nix;
  enabledSubmoduleCount = import ./enabledSubmoduleCount.nix;
  not = x: !x;
in
# !isZero (enabledSubmoduleCount attrSet)
attrSet |> enabledSubmoduleCount |> isZero |> not
