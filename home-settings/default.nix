{
  imports = [
    # ./alacritty/alacritty.nix
    ./kitty/kitty.nix
    ./btop/btop.nix
    ./direnv/direnv.nix
    ./dunst/dunst.nix
    ./fastfetch/fastfetch.nix
    ./fzf/fzf.nix
    ./gtk/gtk.nix
    ./networkmanager/networkmanager.nix
    ./tmux/tmux.nix
    ./wireplumber/wireplumber.nix

    ./packages.nix
    ./common-settings.nix
    # ./gnome-gdm/gnome-gdm.nix
    # ./neovim/neovim.nix
    # ./vscode/vscode.nix
  ];
}
