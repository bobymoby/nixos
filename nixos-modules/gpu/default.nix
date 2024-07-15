{ config, tools, ... }:
let
  enabledGpuDriverCount = tools.enabledSubmoduleCount config.bobymoby.gpu;
in
{
  imports = [ ./proprietary-nvidia-drivers.nix ];

  config = {
    assertions = [
      {
        assertion = enabledGpuDriverCount <= 1;
        message = "Only 1 gpu driver can be enabled at a time";
      }
    ];
  };
}
