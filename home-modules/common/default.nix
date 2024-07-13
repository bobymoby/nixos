{ ... }:

{
  imports = [
    ./alacritty/alacritty.nix
    ./direnv/direnv.nix
    ./dunst/dunst.nix
    ./fastfetch/fastfetch.nix
    ./gtk/gtk.nix
    ./packages.nix
    ./wireplumber/wireplumber.nix
    ./btop/btop.nix
    ./networkmanager/networkmanager.nix

    # ./gnome-gdm/gnome-gdm.nix
    # ./neovim/neovim.nix
    # ./vscode/vscode.nix
  ];

  home.username = "bobymoby";
  home.homeDirectory = "/home/bobymoby";
  programs.home-manager.enable = true;
  home.stateVersion = "23.05";
}
