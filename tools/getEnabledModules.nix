attrSet:
# builtins.filter (name: attrSet.${name}.enable) (builtins.attrNames attrSet)
attrSet |> builtins.attrNames |> builtins.filter (name: attrSet.${name}.enable)
