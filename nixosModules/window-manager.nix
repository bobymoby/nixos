{ pkgs, ... }:

{
  # x+i3 setup
  environment.pathsToLink = [
    "/libexec"
    # "/share/zsh"
  ];
  services = {
    displayManager.defaultSession = "none+i3";

    xserver = {
      enable = true;
      displayManager = {
        startx.enable = true;
        lightdm = {
          enable = true;
          background = ../home-manager/gtk/background.png;

          greeters.gtk = {
            cursorTheme = {
              name = "Bibata-Modern-Ice";
              package = pkgs.bibata-cursors;
              size = 24;
            };

            indicators = [
              "~session"
              "~spacer"
              "~clock"
              "~spacer"
              "~language"
              "~power"
            ];
          };
        };
      };
      desktopManager.xterm.enable = false;
      desktopManager.gnome.enable = true;

      windowManager.i3 = {
        enable = true;
        extraPackages = with pkgs; [
          dmenu
          i3lock
        ];
      };
    };
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

  #wayland+sway setup
  # services.xserver = {
  #   enable = true;
  #   displayManager = {
  #     sddm.enable = true;
  #     # gdm = {
  #     #   enable = true;
  #     #   wayland = true;
  #     # };
  #     # # sessionPackages = with pkgs; [ sway ];
  #     # defaultSession = "nvidiasway";
  #     session = [
  #       {
  #         manage = "desktop";
  #         name = "nvidiasway";
  #         start = ''
  #           exec sway --unsupported-gpu
  #         '';
  #       }
  #     ];
  #   };
  #   videoDrivers = [ "nvidia" ];
  # };
  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true;
  #   package = (pkgs.swayfx.overrideAttrs
  #     (old: {
  #       passthru.providedSessions = [ "sway" ];
  #     }));
  #   extraOptions = [ "--unsupported-gpu" ];
  # };
}
