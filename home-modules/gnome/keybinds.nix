{ lib, tools, ... }:
let
  inherit (lib.hm.gvariant) mkEmptyArray type;
  emptyStringArray = mkEmptyArray type.string;
  keybinds-list = [
    {
      name = "Terminal";
      command = "kitty";
      binding = "<Super>Return";
    }
  ];
  keybinds = builtins.listToAttrs (
    lib.imap (index: elem: {
      name = "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${toString (index - 1)}";
      value = elem;
    }) keybinds-list
  );
  custom-keybindings = map (
    index:
    "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom${toString index}/"
  ) (lib.range 0 (lib.length keybinds-list - 1));
in
tools.mergeAttrSets [
  {
    "org/gnome/settings-daemon/plugins/media-keys" = {
      inherit custom-keybindings;
    };
    "org/gnome/desktop/wm/keybindings" = {
      close = [
        "<Shift><Super>q"
        "<Alt>F4"
      ];
      show-desktop = [ "<Super>d" ];
    };
    "org/gnome/shell/keybindings" = {
      screenshot = emptyStringArray;
      show-screenshot-ui = [ "<Shift><Super>s" ];
    };
    "org/gnome/settings-daemon/plugins/media-keys" = {
      screenreader = emptyStringArray;
      magnifier = emptyStringArray;
      magnifier-zoom-in = emptyStringArray;
      magnifier-zoom-out = emptyStringArray;
    };
  }
  keybinds
]
