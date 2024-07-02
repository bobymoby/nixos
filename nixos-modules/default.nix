{ ... }:

{
  # hardware settings
  imports = [
    ./gpu
    ./sound.nix
    ./input.nix
    ./ssh/ssh.nix
    ./packages.nix
    ./window-manager

    ./common
  ];
}
