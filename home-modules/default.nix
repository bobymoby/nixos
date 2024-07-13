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
}
