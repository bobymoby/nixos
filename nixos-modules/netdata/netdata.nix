{ lib, config, ... }:

{
  options.bobymoby.netdata.enable = lib.mkEnableOption "Enable Netdata";

  config = lib.mkIf config.bobymoby.netdata.enable {
    services.netdata = {
      enable = true;
      python.recommendedPythonPackages = true;
      #   configDir."python.d.conf" = pkgs.writeText "python.d.conf" ''
      #     nvidia_smi: yes
      #   '';
    };
  };
}
