{ lib }:
let
  inherit (builtins) attrNames;
  inherit (lib) filterAttrs;
  #   filterAttrs = pred: set: removeAttrs set (filter (name: !pred name set.${name}) (attrNames set));
in
# attrList: attrNames (filterAttrs (name: value: value == true) attrList)
attrList: attrList |> filterAttrs (name: value: value == true) |> attrNames
