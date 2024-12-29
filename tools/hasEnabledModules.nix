attrSet:
let
  isZero = import ./isZero.nix;
  enabledSubmoduleCount = import ./enabledSubmoduleCount.nix;
in
!isZero (enabledSubmoduleCount attrSet)
