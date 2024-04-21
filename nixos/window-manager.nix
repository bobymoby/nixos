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
<<<<<<< HEAD
      displayManager = {
        desktopManager.xterm.enable = false;
        desktopManager.gnome.enable = true;

        gdm = {
          enable = true;
<<<<<<< HEAD
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
=======
          wayland = true;
>>>>>>> fd9b0a9 (initial setup(very unstable))
        };

        # session = [
        #   {
        #     manage = "desktop";
        #     name = "nvidiasway";
        #     start = ''
        #       exec sway --unsupported-gpu
        #     '';
        #   }
        # ];
=======
      desktopManager.xterm.enable = false;
      desktopManager.gnome.enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
>>>>>>> eebe912 (waybar fixed/plymouth removed)
      };
    };
    displayManager.sessionPackages = with pkgs; [ sway ];
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
