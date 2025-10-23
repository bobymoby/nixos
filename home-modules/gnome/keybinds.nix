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
      move-to-workspace-1 = [ "<Shift><Super>1" ];
      move-to-workspace-2 = [ "<Shift><Super>2" ];
      move-to-workspace-3 = [ "<Shift><Super>3" ];
      move-to-workspace-4 = [ "<Shift><Super>4" ];
      move-to-workspace-5 = [ "<Shift><Super>5" ];
      move-to-workspace-6 = [ "<Shift><Super>6" ];
      move-to-workspace-7 = [ "<Shift><Super>7" ];
      move-to-workspace-8 = [ "<Shift><Super>8" ];
      move-to-workspace-9 = [ "<Shift><Super>9" ];
      move-to-workspace-10 = [ "<Shift><Super>0" ];
      move-to-workspace-11 = [ "<Shift><Super>F1" ];
      move-to-workspace-12 = [ "<Shift><Super>F2" ];

      switch-to-workspace-1 = [ "<Super>1" ];
      switch-to-workspace-2 = [ "<Super>2" ];
      switch-to-workspace-3 = [ "<Super>3" ];
      switch-to-workspace-4 = [ "<Super>4" ];
      switch-to-workspace-5 = [ "<Super>5" ];
      switch-to-workspace-6 = [ "<Super>6" ];
      switch-to-workspace-7 = [ "<Super>7" ];
      switch-to-workspace-8 = [ "<Super>8" ];
      switch-to-workspace-9 = [ "<Super>9" ];
      switch-to-workspace-10 = [ "<Super>0" ];
      switch-to-workspace-11 = [ "<Super>F1" ];
      switch-to-workspace-12 = [ "<Super>F2" ];
    };
    "org/gnome/shell/keybindings" = {
      screenshot = emptyStringArray;
      show-screenshot-ui = [ "<Shift><Super>s" ];
      switch-to-application-1 = emptyStringArray;
      switch-to-application-2 = emptyStringArray;
      switch-to-application-3 = emptyStringArray;
      switch-to-application-4 = emptyStringArray;
      switch-to-application-5 = emptyStringArray;
      switch-to-application-6 = emptyStringArray;
      switch-to-application-7 = emptyStringArray;
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
