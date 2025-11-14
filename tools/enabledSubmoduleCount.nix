attrSet:
let
  isSet = import ./isSet.nix;
  hasEnableOption = import ./hasEnableOption.nix;
in
# builtins.length (
#   builtins.filter (item: (isSet item) && (hasEnableOption item) && item.enable) (
#     builtins.attrValues attrSet
#   )
# )
attrSet
|> builtins.attrValues
|> builtins.filter (item: (isSet item) && (hasEnableOption item) && item.enable)
|> builtins.length
