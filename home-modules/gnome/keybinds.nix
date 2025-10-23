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
  move-to-workspace =
    builtins.listToAttrs (
      map (num: {
        name = "move-to-workspace-${toString num}";
        value = [ "<Shift><Super>${toString num}" ];
      }) (lib.range 1 9)
    )
    // {
      move-to-workspace-10 = [ "<Shift><Super>0" ];
      move-to-workspace-11 = [ "<Shift><Super>F1" ];
      move-to-workspace-12 = [ "<Shift><Super>F2" ];
    };
  switch-to-workspace =
    builtins.listToAttrs (
      map (num: {
        name = "switch-to-workspace-${toString num}";
        value = [ "<Super>${toString num}" ];
      }) (lib.range 1 9)
    )
    // {
      switch-to-workspace-10 = [ "<Super>0" ];
      switch-to-workspace-11 = [ "<Super>F1" ];
      switch-to-workspace-12 = [ "<Super>F2" ];
    };
  switch-to-application = builtins.listToAttrs (
    map (num: {
      name = "switch-to-application-${toString num}";
      value = emptyStringArray;
    }) (lib.range 1 9)
  );
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
    }
    // move-to-workspace
    // switch-to-workspace;

    "org/gnome/shell/keybindings" = {
      screenshot = emptyStringArray;
      show-screenshot-ui = [ "<Shift><Super>s" ];
    }
    // switch-to-application;

    "org/gnome/settings-daemon/plugins/media-keys" = {
      screenreader = emptyStringArray;
      magnifier = emptyStringArray;
      magnifier-zoom-in = emptyStringArray;
      magnifier-zoom-out = emptyStringArray;
    };

  }
  keybinds
]
