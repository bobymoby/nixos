{
  pkgs,
  lib,
  config,
  ...
}:

let
  weather-locations = "[<(uint32 2, <('Sofia Observatory', 'LBSF', false, [(0.74438292597558142, 0.40811615094024323)], @a(dd) [])>)>]";

  favorite-apps-list = [
    "kitty"
    "google-chrome"
    "spotify"
    "webcord"
    "code"
    "idea-ultimate"
    "nemo"
  ];
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    # dash-to-dock
    blur-my-shell
    vitals
  ];
  keybinds-list = [
    {
      name = "Terminal";
      command = "kitty";
      binding = "<Super>Return";
    }
  ];

  pc-only = value: lib.mkIf config.bobymoby.gnome.use-pc-config value;

  favorite-apps = map (app: "${app}.desktop") favorite-apps-list;
  enabled-extensions = map (ext: ext.extensionUuid) extensions;
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
  options.bobymoby.gnome = {
    enable = lib.mkEnableOption "Enable gnome specific settings";
    use-pc-config = lib.mkEnableOption "Use pc specific gnome settings";
  };

  config = lib.mkIf config.bobymoby.gnome.enable {
    dconf = {
      enable = true;
      settings = {
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        "org/gnome/desktop/input-sources" = {
          sources = "[('xkb', 'us'), ('xkb', 'bg+phonetic')]";
          xkb-options = "['terminate:ctrl_alt_bksp', 'grp:lalt_lshift_toggle']";
        };
        "org/gnome/mutter".workspaces-only-on-primary = false;
        "org/gnome/desktop/peripherals/mouse".accel-profile = "flat";
        "org/gnome/Weather".locations = weather-locations;
        "org/gnome/shell/weather".locations = weather-locations;

        "org/gnome/shell" = {
          inherit favorite-apps enabled-extensions;
        };

        "org/gnome/shell/extensions/dash-to-dock" = {
          dock-position = "TOP";
          intellihide = false;
          require-pressure-to-show = false;
          multi-monitor = true;
          show-trash = false;
          hot-keys = false;
          running-indicator-style = "DOTS";
          transparency-mode = "DYNAMIC";
        };

        "org/gnome/shell/extensions/vitals" = {
          menu-centered = true;
          show-gpu = true;
          hot-sensors = [
            "__temperature_avg__"
          ];
        };

        "org/gnome/desktop/session".idle-delay = pc-only 0;

        "org/gnome/settings-daemon/plugins/media-keys" = {inherit custom-keybindings;};
        "org/gnome/shell/keybindings" = {
            screenshot = [];
            show-screenshot-ui = ["<Shift><Super>s"];
        };
      } // keybinds;
    };

    home.packages =
      (with pkgs; [
        gnome-tweaks
        refine
      ])
      ++ extensions;
  };
}
