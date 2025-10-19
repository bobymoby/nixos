{ lib, ... }:
let
  inherit (lib.hm.gvariant) mkTuple;
in
{
  "org/gnome/desktop/input-sources" = {
    sources = [
      (mkTuple [
        "xkb"
        "us"
      ])
      (mkTuple [
        "xkb"
        "bg+phonetic"
      ])
    ];
    xkb-options = [
      #   "terminate:ctrl_alt_bksp"
      "grp:alt_shift_toggle"
    ];
  };
}
