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
    virtualisation.docker.enable = true;
    environment.systemPackages = with pkgs; [ distrobox ];
    virtualisation.libvirtd = lib.mkIf config.bobymoby.virtualization.enable-qemu {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = true;
        swtpm.enable = true;
      };
    };

    programs.virt-manager.enable = config.bobymoby.virtualization.enable-qemu;
  };
}
