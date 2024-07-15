{ system }:
{ inputs }:
import inputs.nixpkgs {
  inherit system;
  config.allowUnfree = true;
}
