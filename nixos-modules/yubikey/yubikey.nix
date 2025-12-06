{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.yubikey = {
    enable = tools.mkEnableOption "Enable yubikey support";
  };

  config = lib.mkIf config.bobymoby.yubikey.enable {
    programs.yubikey-manager.enable = true;
    environment.systemPackages = with pkgs; [
      yubioath-flutter
    ];
    hardware.gpgSmartcards.enable = true;
    programs.gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    services.pcscd.enable = true;
  };
}
