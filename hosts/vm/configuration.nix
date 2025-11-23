{
  inputs,
  config,
  pkgs,
  ...
}:

{
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
    kernelParams = [ "video=1920x1080" ];
  };

  services = {
    spice-vdagentd.enable = true;
    qemuGuest.enable = true;

    xserver.xkb = {
      layout = "us,bg";
      variant = "altgr-intl,phonetic";
      options = "grp:alt_shift_toggle";
    };
  };

  networking = {
    networkmanager.enable = true;
    hostname = "nixos-vm";
  };

  time.timeZone = "Europe/Sofia";
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "en_US.UTF-8";
      LC_IDENTIFICATION = "en_US.UTF-8";
      LC_MEASUREMENT = "en_GB.UTF-8";
      LC_MONETARY = "en_US.UTF-8";
      LC_NAME = "en_US.UTF-8";
      LC_NUMERIC = "en_US.UTF-8";
      LC_PAPER = "en_US.UTF-8";
      LC_TELEPHONE = "en_US.UTF-8";
      LC_TIME = "en_US.UTF-8";
    };
  };

  users.users.bobymoby = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };

  nixpkgs.config.allowUnfree = true;

  nix = {
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    settings = {
      warn-dirty = false;
      experimental-features = [
        "nix-command"
        "flakes"
        "pipe-operators"
      ];
      substituters = [
        "https://nix-community.cachix.org"
      ];
      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
      trusted-users = [
        "bobymoby"
      ];
      auto-optimise-store = true;
    };
  };

  environment.systemPackages = with pkgs; [
    gitFull
    lshw
    neovim
  ];

  system.stateVersion = "25.05";
}
