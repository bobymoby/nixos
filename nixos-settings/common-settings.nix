{
  services.dbus.enable = true;

  services.gvfs.enable = true; # needed for some file managers

  programs.dconf.enable = true;

  networking.networkmanager.enable = true;

  hardware.enableAllFirmware = true;

  security.polkit.enable = true;

  # DO NOT CHANGE. USED FOR COMPATIBILITY.
  # maybe change on reinstall
  system.stateVersion = "23.05";
}
