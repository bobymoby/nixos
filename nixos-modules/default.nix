{ ... }:

{
  # hardware settings
  imports = [
    ./boot.nix
    ./gpu
    ./sound.nix
    ./input.nix
    ./ssh/ssh.nix
    ./common
    ./packages.nix
  ];
}
