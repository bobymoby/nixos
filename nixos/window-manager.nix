{ pkgs, ... }:

{
  # x+i3 setup
  environment.pathsToLink = [
    "/libexec"
    # "/share/zsh"
  ];
  services = {
    xserver = {
      enable = true;
      desktopManager.xterm.enable = false;
      desktopManager.gnome.enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
    displayManager.sessionPackages = with pkgs; [ sway ];
    displayManager.defaultSession = "sway";
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    package = (pkgs.swayfx.overrideAttrs
      (old: {
        passthru.providedSessions = [ "sway" ];
      }));
    # extraOptions = [ "--unsupported-gpu" ];
  };


  # programs.hyprland = {
  #   enable = true;
  #   enableNvidiaPatches = true;
  #   xwayland.enable = true;
  # };

  # services.xserver = {
  #   enable = true;
  #   displayManager.gdm = {
  #     enable = true;
  #     wayland = true;
  #   };
  # };
}
