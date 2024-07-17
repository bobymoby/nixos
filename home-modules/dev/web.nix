{
  lib,
  config,
  pkgs,
  ...
}:

{
  options.bobymoby.dev.web.enable = lib.mkEnableOption "Enable web dev packages";

  config = lib.mkIf config.bobymoby.dev.web.enable {
    home.packages = with pkgs; [
      postman
      dbeaver-bin
    ];
  };
}
