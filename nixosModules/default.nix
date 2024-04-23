{ ... }:

{
  # hardware settings
  imports = [
    ./boot.nix
    ./gpu.nix
    ./sound.nix
    ./input.nix
    ./ssh/ssh.nix

    ./i18n.nix
    ./environment.nix
    ./window-manager.nix
    ./users.nix

    ./packages.nix
    ./fonts.nix
  ];
}
