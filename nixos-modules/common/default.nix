{ ... }:

{
  imports = [
    ./environment.nix
    ./i18n.nix
    ./users.nix
    ./nix-settings.nix
    ./fonts.nix
    ./sound.nix
    ./packages.nix
    ./input.nix
  ];

  services.dbus.enable = true;

  services.gnome.gnome-keyring.enable = true;
  security.pam.services.gdm.enableGnomeKeyring = true;

  services.gvfs.enable = true;

  virtualisation.docker.enable = true;

  programs.dconf.enable = true;

  # DO NOT CHANGE. USED FOR COMPATIBILITY.
  # maybe change on reinstall
  system.stateVersion = "23.05";
}
