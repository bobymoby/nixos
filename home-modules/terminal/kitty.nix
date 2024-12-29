{ lib, config, ... }:
{
  options.bobymoby.terminal.kitty = {
    enable = lib.mkEnableOption "Enable Kitty";
  };

  config.programs.kitty = lib.mkIf config.bobymoby.terminal.kitty.enable {
    enable = true;
    font = {
      name = "DejaVu Sans";
      size = 16;
    };
    settings = {
      enable_audio_bell = false;
    };
    themeFile = "Dracula";
    shellIntegration.enableZshIntegration = config.bobymoby.shell.zsh.enable;
  };
}
