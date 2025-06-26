{ config, ... }:

{
  imports = [
    ./dunst/dunst.nix
    ./mako/mako.nix
    ./swaync/swaync.nix
  ];
}
