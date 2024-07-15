attrSet:
let
  tools = import ./tools.nix;
  isZero = tools.isZero;
  enabledSubmoduleCount = tools.enabledSubmoduleCount;
in
!isZero (enabledSubmoduleCount attrSet)
