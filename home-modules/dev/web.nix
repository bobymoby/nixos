{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.dev.web = {
    enable = tools.mkEnableOption "Enable web dev packages";
    desktopEntries.dbeaver-xwayland.enable = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Add Dbeaver-xwayland desktop entry";
    };
  };

  config = lib.mkIf config.bobymoby.dev.web.enable {
    home.packages = with pkgs; [
      postman
      dbeaver-bin
    ];

    xdg.desktopEntries."dbeaver-xwayland" =
      lib.mkIf config.bobymoby.dev.web.desktopEntries.dbeaver-xwayland.enable
        {
          name = "Dbeaver-xwayland";
          genericName = "Universal Database Manager";
          exec = "env GDK_BACKEND=x11 ${pkgs.dbeaver-bin}/bin/dbeaver";
          terminal = false;
          categories = [
            "IDE"
            "Development"
          ];
          icon = "${pkgs.dbeaver-bin}/share/icons/hicolor/256x256/apps/dbeaver.png";
          mimeType = [ "application/sql" ];
        };
  };
}
