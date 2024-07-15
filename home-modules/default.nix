{ ... }:

{
  imports = [
    ./libinput-gestures/libinput-gestures.nix
    ./shell

    ./gaming/gaming.nix

    ./dev/dev.nix

    ./wayland
    ./X11

    ./easyeffects/easyeffects.nix

    ./common
  ];
}
