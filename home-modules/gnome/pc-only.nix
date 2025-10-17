{ lib, config, ... }:
let
  inherit (lib.hm.gvariant) mkUint32;

  pc-only = value: lib.mkIf config.bobymoby.gnome.use-pc-config value;
in
{
  "org/gnome/desktop/session".idle-delay = pc-only (mkUint32 0);
}
