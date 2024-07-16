attrSet:
let
  tools = import ./.;
  isSet = tools.isSet;
  hasEnableOption = tools.hasEnableOption;
in
builtins.length (
  builtins.filter (item: (isSet item) && (hasEnableOption item) && item.enable) (
    builtins.attrValues attrSet
  )
)
