{ ... }:

{
  # hardware settings
  imports = [
    ./gpu
    ./boot/boot.nix
    ./ssh/ssh.nix
    ./window-manager
    ./login-manager
    ./shell
    ./systemd-services

    ./common
  ];
}
