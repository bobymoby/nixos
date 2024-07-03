{ ... }:

{
  imports = [
    ./alacritty/alacritty.nix
    ./direnv/direnv.nix
    ./dunst/dunst.nix
    ./easyeffects/easyeffects.nix
    ./fastfetch/fastfetch.nix
    ./gtk/gtk.nix
    ./neovim/neovim.nix
    ./shell
    ./libinput-gestures/libinput-gestures.nix

    # ./vscode/vscode.nix
  ];
}
