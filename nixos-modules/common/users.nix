{ pkgs, ... }:

{
  users.users.bobymoby = {
    isNormalUser = true;
    description = "Borimir Georgiev";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
      "docker"
      "input"
      "kvm"
      "adbusers"
      "i2c"
      "openrazer"
      "plugdev"
      "dialout"
      "tss"
    ];
  };
}
