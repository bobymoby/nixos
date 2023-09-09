{ config, pkgs, lib, ... }:
let
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

  services.dbus.enable = true;
  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; #for gtk apps
  };

  environment.systemPackages = with pkgs; [
    dmenu
    i3status
    i3lock
    i3blocks
    picom
    dex
    xss-lock
    networkmanagerapplet
    configure-gtk
    xdg-utils
    eww # widget framework
    #dmenu #application launcher most people use
    #i3status # gives you the default i3 status bar
    #i3lock #default i3 screen locker
    #i3blocks #if you are planning on using i3blocks over i3status
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
    fastfetch
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
    wineWowPackages.full
    # wineWowPackages.staging
    lutris
    protonup-qt
    # vulkan-tools
    # dxvk
    bottles
    heroic
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

  security.polkit.enable = true;
  services.gnome.gnome-keyring.enable = true;

  programs.light.enable = true;

  virtualisation.docker.enable = true;

  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  services.flatpak.enable = true;

  hardware.openrazer.enable = true;

  programs.dconf.enable = true;

  services.gvfs.enable = true;

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

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  hardware.nvidia = {
    modesetting.enable = true; #required
    powerManagement.enable = true;
    open = true; #open source driver
    nvidiaSettings = true; #nvidia-settings menu
    prime = {
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      # reverseSync.enable = true;
      # allowExternalGpu = false;
      # sync.enable = true;
    };

    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.pathsToLink = [ "/libexec" ];
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
        greeter.enable = false; # WIP disable later
      };
    };
    desktopManager.xterm.enable = false;
    videoDrivers = [ "nvidia" ];
    windowManager.i3 = {
      enable = true;
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

  boot = {
    initrd.kernelModules = [ "nvidia" ];
    extraModulePackages = [ config.boot.kernelPackages.nvidia_x11 ];
    plymouth.enable = true; # nix icon
    initrd.systemd.enable = true;
    kernelParams = [
      "quiet"
      # "module_blacklist=i915" # disable intel gpu
    ];
    # kernelPackages = pkgs.linuxPackages_latest;
  };





  system.stateVersion = "23.05";
}
