{ ... }:

{
  imports = [
    ./gpu
    ./window-manager
    ./login-manager
    ./shell
    ./systemd-services # has common services
    ./steam/steam.nix
    ./bluetooth/bluetooth.nix
    ./netdata/netdata.nix
    ./virtualization/virtualization.nix

    ./common
  ];
}
