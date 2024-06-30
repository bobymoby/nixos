{ ... }:

{
  imports = [
    ./alacritty/alacritty.nix
    ./direnv/direnv.nix
    ./easyeffects/easyeffects.nix
    ./fastfetch/fastfetch.nix
    ./gtk/gtk.nix
    ./shell/zsh.nix
    ./neovim/neovim.nix

    # ./vscode/vscode.nix
  ];
}
