attrSet:
(builtins.hasAttr "enable" attrSet)
&& (builtins.typeOf attrSet.enable) == "bool"
