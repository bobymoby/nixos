attrSet:
let
  tools = import ./.;
  isZero = tools.isZero;
  enabledSubmoduleCount = tools.enabledSubmoduleCount;
in
!isZero (enabledSubmoduleCount attrSet)
