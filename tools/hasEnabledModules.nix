attrSet:
let
  tools = import ./tools.nix;
  isZero = tools.isZero;
  isSet = tools.isSet;
  hasEnableOption = tools.hasEnableOption;
in
(
  !isZero (
    builtins.length (
      builtins.filter (item: (isSet item) && (hasEnableOption item) && item.enable) (
        builtins.attrValues attrSet
      )
    )
  )
)
