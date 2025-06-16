{ system }:
{
  inputs,
  overlays,
  pkgs,
}:
import pkgs {
  inherit system overlays;
  config.allowUnfree = true;
}
