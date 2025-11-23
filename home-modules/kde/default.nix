{
  lib,
  config,
  pkgs,
  tools,
  ...
}:
{
  imports = [
    ./input.nix
    ./theme.nix
    ./krunner.nix
    ./kwin.nix
    ./panel.nix
    ./powerdevil.nix
    ./keybinds.nix
  ];

  options.bobymoby.kde = {
    enable = tools.mkEnableOption "Enable KDE Plasma";
    use-pc-config = tools.mkEnableOption "Use pc-config for KDE settings";
    use-laptop-config = tools.mkEnableOption "Use laptop-config for KDE settings";
  };

  config = lib.mkIf config.bobymoby.kde.enable {
    programs.plasma = {
      enable = true;
      overrideConfig = true;

      session = {
        general.askForConfirmationOnLogout = false;
        sessionRestore.restoreOpenApplicationsOnLogin = "startWithEmptySession";
      };

      workspace.enableMiddleClickPaste = false;

      configFile = {
        kdeglobals.General = {
          TerminalApplication = "kitty";
          TerminalService = "kitty.desktop";
        };
        systemsettingsrc.systemsettings_sidebar_mode.HighlightNonDefaultSettings = true;
        plasmaparc.General.AudioFeedback = false;
      };
    };
    services.gpg-agent = {
      pinentry.package = lib.mkForce pkgs.kwalletcli;
      extraConfig = "pinentry-program ${pkgs.kwalletcli}/bin/pinentry-kwallet";
    };
  };
}
