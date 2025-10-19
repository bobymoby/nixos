{
  pkgs,
  lib,
  config,
  tools,
  ...
}:
# https://github.com/nix-community/home-manager/blob/master/modules/lib/gvariant.nix
let
  extensions = with pkgs.gnomeExtensions; [
    appindicator
    # dash-to-dock
    blur-my-shell
    vitals
    gsconnect
  ];

  common = import ./common.nix {
    gnome-extensions = extensions;
    inherit lib tools;
  };
  pc-only = import ./pc-only.nix { inherit lib config; };
  laptop-only = import ./laptop-only.nix { inherit lib config; };
in
{
  options.bobymoby.gnome = {
    enable = lib.mkEnableOption "Enable gnome specific settings";
    use-pc-config = lib.mkEnableOption "Use pc specific gnome settings";
    use-laptop-config = lib.mkEnableOption "Use laptop specific gnome settings";
  };

  config = lib.mkIf config.bobymoby.gnome.enable {
    dconf = {
      enable = true;
      settings = tools.mergeAttrSets [
        common
        pc-only
        laptop-only
      ];
    };

    home.file.".gradient.png".source = ../../assets/gradient.png;

    home.packages =
      (with pkgs; [
        gnome-tweaks
        refine
      ])
      ++ extensions;
  };
}
