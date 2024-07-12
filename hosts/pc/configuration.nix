{ config, pkgs, ... }:

{
  imports = [ ./hardware-config ];

  networking.hostName = "BobiNixOS";
  networking.networkmanager.enable = true;

  bobymoby = {
    windowManager.hyprland.enable = true;
    shell.zsh.enable = true;

    steam.enable = true;
  };

  services.ratbagd.enable = true; # needed for piper

  environment.systemPackages = with pkgs; [
    piper # GUI for configuring gaming mice
    mangohud
    dotnet-runtime_8
  ];
  # services.netdata = {
  #   enable = true;
  #   python.recommendedPythonPackages = true;
  #   configDir."python.d.conf" = pkgs.writeText "python.d.conf" ''
  #     nvidia_smi: yes
  #   '';
  # };
}
