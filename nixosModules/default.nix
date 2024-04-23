{ ... }:

{
  # hardware settings
  imports = [
    ./boot.nix
    ./gpu.nix
    ./sound.nix
    ./input.nix
    ./ssh/ssh.nix
    ./common
    ./packages.nix
  ];
}
