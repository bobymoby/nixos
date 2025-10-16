{ lib, ... }:
let
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
{
  "org/gnome/settings-daemon/plugins/media-keys" = {
    inherit custom-keybindings;
  };
  "org/gnome/shell/keybindings" = {
    screenshot = [ ];
    show-screenshot-ui = [ "<Shift><Super>s" ];
    close = [ "<Shift><Super>q" ];
  };
}
// keybinds
