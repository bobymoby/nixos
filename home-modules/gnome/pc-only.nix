{ lib, config, ... }:
let
  pc-only = value: lib.mkIf config.bobymoby.gnome.use-pc-config value;
in
{
  "org/gnome/desktop/session".idle-delay = pc-only 0;
}
