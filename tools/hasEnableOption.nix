let
  inherit (builtins) typeOf hasAttr;
in
attrSet: (hasAttr "enable" attrSet) && (typeOf attrSet.enable) == "bool"
