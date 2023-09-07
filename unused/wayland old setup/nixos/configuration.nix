{ config, pkgs, lib, ... }:

let
  # bash script to let dbus know about important env variables and
  # propagate them to relevent services run at the end of sway config
  # see
  # https://github.com/emersion/xdg-desktop-portal-wlr/wiki/"It-doesn't-work"-Troubleshooting-Checklist
  # note: this is pretty much the same as  /etc/sway/config.d/nixos.conf but also restarts  
  # some user services to make sure they have the correct environment variables
  dbus-sway-environment = pkgs.writeTextFile {
    name = "dbus-sway-environment";
    destination = "/bin/dbus-sway-environment";
    executable = true;

    text = ''
      dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      systemctl --user stop pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
      systemctl --user start pipewire pipewire-media-session xdg-desktop-portal xdg-desktop-portal-wlr
    '';
  };

  # currently, there is some friction between sway and gtk:
  # https://github.com/swaywm/sway/wiki/GTK-3-settings-on-Wayland
  # the suggested way to set gtk settings is with gsettings
  # for gsettings to work, we need to tell it where the schemas are
  # using the XDG_DATA_DIR environment variable
  # run at the end of sway config
  configure-gtk = pkgs.writeTextFile {
    name = "configure-gtk";
    destination = "/bin/configure-gtk";
    executable = true;
    text =
      let
        schema = pkgs.gsettings-desktop-schemas;
        datadir = "${schema}/share/gsettings-schemas/${schema.name}";
      in
      ''
        export XDG_DATA_DIRS=${datadir}:$XDG_DATA_DIRS
        gnome_schema=org.gnome.desktop.interface
        gsettings set $gnome_schema gtk-theme 'Dracula'
      '';
  };
in
{
  imports =
    [
      ./hardware-configuration.nix
    ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  nixpkgs.config.allowUnfree = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Sofia";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "bg_BG.UTF-8";
    LC_IDENTIFICATION = "bg_BG.UTF-8";
    LC_MEASUREMENT = "bg_BG.UTF-8";
    LC_MONETARY = "bg_BG.UTF-8";
    LC_NAME = "bg_BG.UTF-8";
    LC_NUMERIC = "bg_BG.UTF-8";
    LC_PAPER = "bg_BG.UTF-8";
    LC_TELEPHONE = "bg_BG.UTF-8";
    LC_TIME = "bg_BG.UTF-8";
  };

  users.users.bobymoby = {
    isNormalUser = true;
    description = "Borimir Georgiev";
    extraGroups = [ "networkmanager" "wheel" "libvirtd" "docker" "input" "kvm" "adbusers" "i2c" "openrazer" "plugdev" ];
  };

  environment.systemPackages = with pkgs; [
    # sway packages from docs
    dbus-sway-environment
    configure-gtk
    wayland
    xdg-utils # for opening default programs when clicking links
    glib # gsettings
    swaylock
    swayidle
    grim # screenshot functionality
    slurp # screenshot functionality
    wl-clipboard # wl-copy and wl-paste for copy/paste from stdin / stdout
    bemenu # wayland clone of dmenu
    mako # notification system developed by swaywm maintainer
    wdisplays # tool to configure displays
    wayland
    # qol
    chromium
    qbittorrent
    # editors + utils
    vscode
    neovim
    nixpkgs-fmt
    # terminal + minor utils
    git
    zsh
    neofetch
    alacritty
    lshw # list gpus
    # io(controlled with sway bindings)
    pulseaudio
    brightnessctl
    # razer mouse control
    openrazer-daemon
    polychromatic # gui
    # gaming and windows emulation
    # wine
    # winetricks
    wineWowPackages.waylandFull
    # wineWowPackages.staging
    lutris
    protonup-qt
    # vulkan-tools
    # dxvk
    bottles

    # nvidia-dkms
    # nvidia-utils
    # lib32-nvidia-utils
    # nvidia-settings
    # vulkan-icd-loader
    # lib32-vulkan-icd-loader

  ];

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio = {
    # enable = true;
    support32Bit = true;
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  # xdg-desktop-portal works by exposing a series of D-Bus interfaces
  # known as portals under a well-known name
  # (org.freedesktop.portal.Desktop) and object path
  # (/org/freedesktop/portal/desktop).
  # The portal interfaces include APIs for file access, opening URIs,
  # printing and others.
  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; #for gtk apps
  };

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  programs.light.enable = true;

  virtualisation.docker.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.flatpak.enable = true;

  hardware.openrazer.enable = true;

  fonts.packages = with pkgs;
    [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      nerdfonts
    ];

  # media keys fixed with sway bindings
  # services.xserver.libinput.naturalScrolling = false;
  # services.xserver.libinput.enable = true;
  # services.xserver.libinput.middleEmulation = true;
  # services.xserver.libinput.tapping = true;
  # boot.kernelParams = [ "psmouse.synaptics_intertouch=0" ];
  # sound.mediaKeys.enable = true;
  # programs.dconf.enable = true;
  # services.xserver.enable = true;
  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;
  # services.xserver.displayManager.defaultSession = "plasmawayland";

  # services.xserver = {
  #   displayManager.sessionPackages = [ pkgs.sway ];
  #   videoDrivers = [ "nouveau" ];
  # };
  # # enable sway window manager
  # programs.sway = {
  #   enable = true;
  #   wrapperFeatures.gtk = true;
  #   package = (pkgs.swayfx.overrideAttrs
  #     (old: {
  #       passthru.providedSessions = [ "sway" ];
  #     }));
  # };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.gvfs.enable = true;

  # hardware.nvidia = {
  #   modesetting.enable = true; #required
  #   powerManagement.enable = true;
  #   open = true; #open source driver
  #   nvidiaSettings = true; #nvidia-settings menu
  #   #   # gpu offloading
  #   # prime = {
  #   #   intelBusId = "PCI:0:2:0";
  #   #   nvidiaBusId = "PCI:1:0:0";
  #   # };

  #   # package = config.boot.kernelPackages.nvidiaPackages.vulkan_beta;
  #   # package = config.boot.kernelPackages.nvidiaPackages.stable;
  # };

  hardware.bumblebee = {
    enable = true;
    driver = "nouveau";
  };

  services.xserver = {
    enable = true;
    displayManager = {
      # sddm.enable = true;
      # defaultSession = "plasmawayland";
      gdm = {
        enable = true;
        wayland = true;
      };
      sessionPackages = [ pkgs.sway ];
    };
    # desktopManager = {
    # plasma5.enable = true;
    # };
    videoDrivers = [ "nouveau" ];
    # videoDrivers = [ "nvidia" ];
  };

  programs.sway = {
    enable = true;
    wrapperFeatures.gtk = true;
    package = (pkgs.swayfx.overrideAttrs
      (old: {
        passthru.providedSessions = [ "sway" ];
      }));
  };

  system.stateVersion = "23.05";
}
