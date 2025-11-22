{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.virtualization = {
    enable = lib.mkEnableOption "Enable Virtualization";
    enable-qemu = lib.mkEnableOption "Enable QEMU";
  };

  config = lib.mkIf config.bobymoby.virtualization.enable {
    environment.systemPackages = with pkgs; [ distrobox ];
    virtualisation = {
      docker.enable = true;

      libvirtd = lib.mkIf config.bobymoby.virtualization.enable-qemu {
        enable = true;
        qemu = {
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };
    };

    programs.virt-manager.enable = config.bobymoby.virtualization.enable-qemu;
  };
}
