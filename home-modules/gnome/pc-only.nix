{ lib, ... }:
let
  inherit (lib.hm.gvariant) mkUint32;
in
{
  "org/gnome/desktop/session".idle-delay = mkUint32 0;
  "org/gnome/settings-daemon/plugins/power" = {
    sleep-inactive-ac-type = "nothing";
  };
}
