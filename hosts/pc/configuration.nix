{ pkgs, ... }:

{
  networking.hostName = "BobiNixOS";

  bobymoby = {
    windowManager.hyprland.enable = true;
    shell.zsh.enable = true;
    virtualization.enable = true;
    steam.enable = true;
    # netdata.enable = true;
  };

  services.ratbagd.enable = true; # needed for piper

  environment.systemPackages = with pkgs; [
    piper # GUI for configuring gaming mice
  ];
}
