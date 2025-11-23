{
  imports = [
    ./bluetooth/bluetooth.nix
    ./debug/debug.nix
    ./gpu
    ./login-manager
    ./netdata/netdata.nix
    ./shell
    ./steam/steam.nix
    ./virtualization/virtualization.nix
    ./desktop-environment
    ./systemd-services
  ];
}
