{ lib }:
let
  inherit (lib) mkOption;
in
description:
mkOption {
  default = false;
  example = true;

  type = lib.types.bool;

  visible = true;

  inherit description;
}
