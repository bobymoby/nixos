{
  imports = [
    ./ssh/ssh.nix
    ./systemd-services

    ./boot.nix
    ./common-settings.nix
    ./environment.nix
    ./fonts.nix
    ./i18n.nix
    ./input.nix
    ./nix-settings.nix
    ./packages.nix
    ./sound.nix
    ./users.nix
  ];
}
