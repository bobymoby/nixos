{
  pkgs,
  lib,
  config,
  ...
}:

{
  options.bobymoby.shell.fish.enable = lib.mkEnableOption "Enable fish";

  config = lib.mkIf config.bobymoby.shell.fish.enable {
    programs = {
      fish.enable = true;
      bash.interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };
}
