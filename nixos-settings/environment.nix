{
  pkgs,
  ...
}:

{
  config.environment.sessionVariables = rec {
    XDG_CACHE_HOME = "$HOME/.cache";
    XDG_CONFIG_HOME = "$HOME/.config";
    XDG_DATA_HOME = "$HOME/.local/share";
    XDG_STATE_HOME = "$HOME/.local/state";
    # Not officially in the specification
    XDG_BIN_HOME = "$HOME/.local/bin";
    PATH = [ "${XDG_BIN_HOME}" ];

    FLAKE = "/etc/nixos";
    NH_FLAKE = FLAKE;

    GSETTINGS_SCHEMA_DIR = "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";

    # NIXOS_OZONE_WL = lib.mkIf config.bobymoby.desktop-environment.hyprland.enable "1";
    NIXOS_OZONE_WL = "1";
  };
}
