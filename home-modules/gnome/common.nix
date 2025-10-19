{
  gnome-extensions,
  lib,
  tools,
  ...
}:

let
  inherit (lib.hm.gvariant) mkTuple;

  favorite-apps = import ./favorite-apps.nix;
  keybinds = import ./keybinds.nix { inherit lib tools; };
  extensions = import ./extensions.nix { inherit gnome-extensions; };
  weather = import ./weather.nix { inherit lib; };
  input = import ./input.nix { inherit lib; };
  background = import ./background.nix;

in
tools.mergeAttrSets [
  {
    "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    "org/gnome/mutter".workspaces-only-on-primary = false;
    "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
    "org/gnome/desktop/interface".enable-hot-corners = false;
    "org/gnome/desktop/wm/preferences".button-layout = "appmenu:minimize,close";
  }
  favorite-apps
  keybinds
  extensions
  weather
  input
  background
]
