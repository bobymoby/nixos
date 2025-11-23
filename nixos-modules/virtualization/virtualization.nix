{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

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
          package = pkgs.qemu_kvm;
          runAsRoot = true;
          swtpm.enable = true;
        };
      };
    };

    programs.virt-manager.enable = config.bobymoby.virtualization.enable-qemu;
  };
}
