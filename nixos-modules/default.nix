{ ... }:

{
  # hardware settings
  imports = [
    ./gpu
    ./boot/boot.nix
    ./ssh/ssh.nix
    ./window-manager
    ./desktop-manager
    ./shell

    ./common
  ];
}
