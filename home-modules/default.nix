{ ... }:

{
  imports = [
    ./libinput-gestures/libinput-gestures.nix
    ./shell

    ./gaming/gaming.nix

    ./jetbrains/jetbrains.nix

    ./wayland
    ./X11

    ./easyeffects/easyeffects.nix

    ./common
  ];

  home.username = "bobymoby";
  home.homeDirectory = "/home/bobymoby";
  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
