attrSet:
builtins.filter (name: attrSet.${name}.enable) (builtins.attrNames attrSet)
