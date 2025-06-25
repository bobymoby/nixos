{
  imports = [
    ./btop/btop.nix
    ./direnv/direnv.nix
    ./fastfetch/fastfetch.nix
    ./fzf/fzf.nix
    ./zoxide/zoxide.nix
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
