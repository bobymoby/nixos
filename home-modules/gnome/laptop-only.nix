{ lib, config, ... }:
let
  laptop-only = value: lib.mkIf config.bobymoby.gnome.use-laptop-config value;
in
{ }
