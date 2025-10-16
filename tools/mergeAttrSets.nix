let
    length = builtins.length;
    elemAt = builtins.elemAt;
    head = list: elemAt list 0;
    isAttrs = x: (builtins.typeOf x) == "set";
    zipAttrsWith = builtins.zipAttrsWith;
    foldr = op: nul: list:
    let
      len = length list;
      fold' = n: if n == len then nul else op (elemAt list n) (fold' (n + 1));
    in
    fold' 0;
    recursiveUpdateUntil =
    pred: lhs: rhs:
    let
      f =
        attrPath:
        zipAttrsWith (
          n: values:
          let
            here = attrPath ++ [ n ];
          in
          if length values == 1 || pred here (elemAt values 1) (head values) then
            head values
          else
            f here values
        );
    in
    f [ ] [ rhs lhs ];
    recursiveUpdate = lhs: rhs:
    recursiveUpdateUntil (
      path: lhs: rhs:
      !(isAttrs lhs && isAttrs rhs)
    ) lhs rhs;
in
listArrtSets: foldr recursiveUpdate { } listArrtSets
