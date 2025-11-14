attrSet:
let
  isSet = import ./isSet.nix;
  hasEnableOption = import ./hasEnableOption.nix;
  inherit (builtins) length filter attrValues;
in
# builtins.length (
#   builtins.filter (item: (isSet item) && (hasEnableOption item) && item.enable) (
#     builtins.attrValues attrSet
#   )
# )
attrSet
|> attrValues
|> filter (item: (isSet item) && (hasEnableOption item) && item.enable)
|> length
