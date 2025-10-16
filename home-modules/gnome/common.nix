{ gnome-extensions, lib, ... }:

let
  favorite-apps = import ./favorite-apps.nix;
  keybinds = import ./keybinds.nix { inherit lib; };
  extensions = import ./extensions.nix { inherit gnome-extensions; };

  weather-locations = "[<(uint32 2, <('Sofia Observatory', 'LBSF', false, [(0.74438292597558142, 0.40811615094024323)], @a(dd) [])>)>]";
in
lib.fold lib.recursiveUpdate
  {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/desktop/input-sources" = {
      sources = "[('xkb', 'us'), ('xkb', 'bg+phonetic')]";
      xkb-options = "['terminate:ctrl_alt_bksp', 'grp:lalt_lshift_toggle']";
    };
    "org/gnome/mutter".workspaces-only-on-primary = false;
    "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
    "org/gnome/Weather".locations = weather-locations;
    "org/gnome/shell/weather".locations = weather-locations;
  }
  [
    favorite-apps
    keybinds
    extensions
  ]
