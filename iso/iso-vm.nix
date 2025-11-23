{ pkgs, modulesPath, ... }:

{
  imports = [ (modulesPath + "/installer/cd-dvd/installation-cd-graphical-calamares-gnome.nix") ];
  environment.systemPackages = with pkgs; [
    vscode
    gitFull
    lshw
    bitwarden-desktop
    neovim
  ];
  isoImage.squashfsCompression = "gzip -Xcompression-level 1";
  nixpkgs.config.allowUnfree = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "pipe-operators"
  ];

  services = {
    spice-vdagentd.enable = true;
    qemuGuest.enable = true;
  };
}
