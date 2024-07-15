{
  imports = [ ./hardware-config ];

  networking.hostName = "BobiLaptopNixOS";

  hardware.openrazer.enable = true; # razer mouse control

  bobymoby = {
    windowManager.hyprland.enable = true;
    loginManager.gdm.enable = true;
    shell.zsh.enable = true;
    virtualization.enable = true;
  };
}
