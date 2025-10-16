{ pkgs, ... }:

{
  imports = [ ./hardware-config ];

  networking.hostName = "BobiLaptopNixOS";

  # hardware.openrazer.enable = true; # razer mouse control

  bobymoby = {
    # desktop-environment.hyprland = {
    #   enable = true;
    #   autoStart = true;
    # };
    desktop-environment.gnome.enable = true;
    login-manager.gdm.enable = true;
    # login-manager.gdm.enable = true;
    shell.zsh.enable = true;
    virtualization.enable = true;
    # netdata.enable = true;
  };

  #programs.niri.enable = true;

  networking.firewall = {
    allowedTCPPorts = [
      7777
      25565
      3000
      5000
    ];
    allowedUDPPorts = [
      7777
      25565
    ];
  };

  environment.systemPackages = with pkgs; [
    icu
  ];

  #   services.logmein-hamachi.enable = true;
  #   programs.haguichi.enable = true;

  xdg.portal.config.common.default = "*";
}
