{
  lib,
  config,
  pkgs,
  tools,
  mySpecialArgs,
  ...
}:
let
  inherit (mySpecialArgs) pkgsStable;
in
{
  options.bobymoby.virtualization = {
    enable = tools.mkEnableOption "Enable Virtualization";
    enable-qemu = tools.mkEnableOption "Enable QEMU";
  };

  config = lib.mkIf config.bobymoby.virtualization.enable {
    environment.systemPackages = with pkgs; [ distrobox ];
    virtualisation = {
      docker.enable = true;

      libvirtd = lib.mkIf config.bobymoby.virtualization.enable-qemu {
        enable = true;
        qemu = {
          package = pkgsStable.qemu_full;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };
    };

    programs.virt-manager.enable = config.bobymoby.virtualization.enable-qemu;
  };
}
