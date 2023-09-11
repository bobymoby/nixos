{ pkgs, ... }:

{
  # x+i3 setup
  environment.pathsToLink = [
    "/libexec"
    "/share/zsh"
  ];
  services.xserver = {
    enable = true;
    displayManager = {
      defaultSession = "none+i3";
      autoLogin = {
        # WIP disable later
        enable = true;
        user = "bobymoby";
      };
      lightdm = {
        enable = true;
        background = ../home-manager/i3/background.png;
        greeter.enable = false; # WIP enable later
      };
    };
    desktopManager.xterm.enable = false;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
        i3lock
      ];
    };
    libinput = {
      enable = true;
      touchpad = {
        naturalScrolling = true;
      };
      mouse = {
        accelProfile = "flat";
      };
    };
    layout = "us,bg";
    xkbVariant = "altgr-intl,phonetic";
    xkbOptions = "grp:alt_shift_toggle";
    excludePackages = with pkgs; [
      xterm
    ];
  };

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
