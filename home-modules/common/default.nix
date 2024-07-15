{
  imports = [
    ./alacritty/alacritty.nix
    ./btop/btop.nix
    ./direnv/direnv.nix
    ./dunst/dunst.nix
    ./fastfetch/fastfetch.nix
    ./gtk/gtk.nix
    ./networkmanager/networkmanager.nix
    ./wireplumber/wireplumber.nix

    ./packages.nix
    ./common-settings.nix
    # ./gnome-gdm/gnome-gdm.nix
    # ./neovim/neovim.nix
    # ./vscode/vscode.nix
  ];
}
