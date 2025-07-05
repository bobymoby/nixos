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
    shellIntegration.enableFishIntegration = config.bobymoby.shell.fish.enable;

    enableGitIntegration = true;

    keybindings = {
      "ctrl+backspace" = "send_text all \\x17";
    };
  };
}
