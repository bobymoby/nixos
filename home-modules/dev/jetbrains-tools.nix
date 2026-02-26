{
  lib,
  config,
  pkgs,
  tools,
  ...
}:

{
  options.bobymoby.dev.jetbrains-tools = {
    enable = tools.mkEnableOption "Enable JetBrains tools";
    rider = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Install JetBrains Rider IDE";
    };
    idea-ultimate = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Install JetBrains IntelliJ IDEA Ultimate IDE";
    };
    clion = lib.mkOption {
      type = lib.types.bool;
      default = true;
      description = "Install JetBrains CLion IDE";
    };
  };

  config = lib.mkIf config.bobymoby.dev.jetbrains-tools.enable {
    # home.packages = with pkgs.jetbrains; [
    #   rider
    #   idea-ultimate
    # ];
    home.packages = tools.listToPackageSet pkgs.jetbrains (
      tools.enabledAttrsToList config.bobymoby.dev.jetbrains-tools
    );
  };
}
