{pkgs, ...}:

{
  imports = [ ./hardware-config ];

  networking.hostName = "BobiLaptopNixOS";

  hardware.openrazer.enable = true; # razer mouse control

  bobymoby = {
    window-manager.hyprland.enable = true;
    login-manager.gdm.enable = true;
    shell.zsh.enable = true;
    virtualization.enable = true;
  };

  networking.firewall = {
    allowedTCPPorts = [ 7777 ];
    allowedUDPPorts = [ 7777 ];
  };

  environment.systemPackages = with pkgs; [
    icu
  ];
}
