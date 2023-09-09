{ pkgs, lib, ... }:

# Created By @icanwalkonwater
# Edited and ported to Nix by Th0rgal

let
  ac = "#1E88E5";
  mf = "#383838";

  bg = "#00000000";
  fg = "#FFFFFF";

  # Colored
  primary = "#91ddff";

  # Dark
  secondary = "#141228";

  # Colored (light)
  tertiary = "#65b2ff";

  # white
  quaternary = "#ecf0f1";

  # middle gray
  quinternary = "#20203d";

  # Red
  urgency = "#e74c3c";

  customPolybar = pkgs.polybar.override {
    i3Support = true;
    alsaSupport = true;
  };

in
{
  services.polybar = {
    enable = true;

    package = customPolybar;

    script = "polybar -q bar &";

  };

  systemd.user.services.polybar.Service = {
    Environment = lib.mkForce "";
    PassENvironment = "PATH";
  };

  # xdg.configFile."polybar".source = pkgs.symlinkJoin {
  #   name = "polybar-symlinks";
  #   paths =
  #     let
  #       polybar-themes = pkgs.fetchFromGitHub {
  #         owner = "adi1090x";
  #         repo = "polybar-themes";
  #         rev = "master"; # Or, better, use a specific commit so you don't have to update the sha256-hash all the time
  #         sha256 = "sha256-X1JnL1HHtSKk3rT/zD4vQpl6c9flSC+2A1wGC06E02Y="; # Fill this in with the hash that nix provides when you attempt to build your config using this
  #       };
  #     in
  #     [
  #       "${polybar-themes}/fonts"
  #       "${polybar-themes}/simple/colorblocks"
  #     ];
  # };
  home.file.".config/polybar/config.ini".source = ./config.ini;
}
