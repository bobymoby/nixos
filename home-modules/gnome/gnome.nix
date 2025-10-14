{ pkgs, lib, config, ... }:

{
  options.bobymoby.gnome.enable = lib.mkEnableOption "Enable gnome specific settings";

  config = lib.mkIf config.bobymoby.gnome.enable {
    dconf.settings = {
        "org/gnome/desktop/interface".color-scheme = "prefer-dark";
        "org/gnome/desktop/input-sources" = {
            sources = "[('xkb', 'us'), ('xkb', 'bg+phonetic')]";
            xkb-options = "['terminate:ctrl_alt_bksp', 'grp:lalt_lshift_toggle']";
        };
    };

    home.packages = with pkgs; [
        gnome-tweaks
        refine
    ];
  };
}
