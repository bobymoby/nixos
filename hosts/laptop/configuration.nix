{ pkgs, ... }:

{
  imports = [ ./hardware-config ];

  networking.hostName = "BobiLaptopNixOS";

  # hardware.openrazer.enable = true; # razer mouse control

  bobymoby = {
    # desktop-environment.hyprland = {
    #   enable = true;
    #   #   autoStart = true;
    # };
    # desktop-environment.gnome.enable = true;
    # login-manager.gdm.enable = true;
    # kde.enable = true;

    login-manager.gdm.enable = true;
    desktop-environment.niri.enable = true;

    shell.zsh.enable = true;
    virtualization = {
      enable = true;
      enable-qemu = true;
    };
    yubikey.enable = true;
    # netdata.enable = true;
  };

  #programs.niri.enable = true;

  networking.firewall = {
    allowedTCPPorts = [ ];
    allowedUDPPorts = [ ];
  };

  boot.kernelPackages = pkgs.linuxPackages_cachyos;

  # boot.kernelPackages = pkgs.linuxPackages_latest;

  #   services.logmein-hamachi.enable = true;
  #   programs.haguichi.enable = true;

  xdg.portal.config.common.default = "*";
}
