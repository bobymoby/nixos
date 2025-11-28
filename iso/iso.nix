{ pkgs, modulesPath, ... }:

{
  imports = [
    (modulesPath + "/installer/cd-dvd/installation-cd-minimal-new-kernel-no-zfs.nix")
  ];
  environment.systemPackages = with pkgs; [
    gitFull
    lshw
    neovim
  ];
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "pipe-operators"
  ];
}
