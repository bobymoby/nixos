{ system }:
{
  inputs,
  overlays,
  pkgs,
}:
import pkgs {
  inherit system overlays;
  config = {
    allowUnfree = true;
    permittedInsecurePackages = [ "qtwebengine-5.15.19" ];
  };
}
