{
  config,
  lib,
  mySpecialArgs,
  ...
}:

{
  options.bobymoby.dev.zed.enable = lib.mkEnableOption "Enable Zed";

  config = lib.mkIf config.bobymoby.dev.zed.enable {
    home = {
      file.".config/zed" = {
        source = ./config;
        recursive = true;
      };

      packages = with mySpecialArgs.pkgsLatest; [
        zed-editor
      ];
    };
  };
}
