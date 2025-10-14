# First build (Outdated but still useful)

Add these lines to configuration.nix:

```nix
nixpkgs.config.allowUnfree = true;
nix.settings.experimental-features = [ "nix-command" "flakes" ];

environment.systemPackages = with pkgs; [
    ...
    git
    vscode
    nh
];

networking.hostName = "Bobi<Laptop>NixOS";
```

Run:

-   ```bash
     sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
     sudo nix-channel --update
     sudo nixos-rebuild switch
    ```
-   clone this repo
-   ```bash
      sudo chown -R bobymoby /etc/nixos
      chmod +x /etc/nixos/**/*.sh
    ```

Fix `/hosts/**/hardware-config/hardware-configuration.nix`

Run

-   ```bash
    nix build --no-link .#homeConfigurations.bobymoby@Bobi<Laptop>NixOS.activationPackage
    "$(nix path-info .#homeConfigurations.bobymoby@Bobi<Laptop>NixOS.activationPackage)"/activate
    FLAKE="/etc/nixos"
    nh os switch
    nh home switch
    sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    reboot
    ```
-   load easyeffects preset(should not be necessary after latest commits)

# Windows setup

-   Do the steps from this answer and it's comments: https://askubuntu.com/a/1251469 https://forums.linuxmint.com/viewtopic.php?t=344835.

# Known issues

-   command-not-found is not supported for flakes. As a workaround, channels are used for the first build. https://github.com/NixOS/nixpkgs/issues/171054
-   Session sometimes hangs after suspend. https://github.com/NVIDIA/open-gpu-kernel-modules/issues/472
-   Electron-based apps have problems with resizing. https://github.com/hyprwm/Hyprland/issues/6552 https://github.com/hyprwm/Hyprland/issues/1462
-   Gruvbox theme nixpkgs package does not provide some of the themes. https://github.com/NixOS/nixpkgs/issues/323833
-   Wifi sometimes does not work after using windows due to a windows issue/optimization.
-   easyeffects sometimes hangs
-   btop hangs on suspend

# Useful commands

-   `nh os switch`
-   `nh home switch`
-   `nh ... -u`
-   `nix flake lock --update-input nixpkgs --update-input home-manager`

# Options

```
nix:
    bobymoby
        useDefaultPackages(true by default)
        steam.enable
        bluetooth.enable
        netdata.enable
        virtualization.enable
        debug
            enabl
            man-pages
        login-manager
            gdm.enable
            lightdm.enable
            sddm
                enable
                wayland.enable
        shell
            fish.enable
            zsh.enable
        desktop-environment
            i3.enable
            hyprland.enable
        gpu.proprietary-nvidia-drivers
            enable
            prime.enable
            use-beta
            forceFullCompositionPipeline

home-manager:
    bobymoby
        libinput-gestures.enable
        dev
            nix.enable
            web
                enable
                desktopEntries.dbeaver-xwayland.enable(true by default when web is enabled)
            integrated.enable
            jetbrains-tools.enable
        shell
            fish.enable
            zsh.enable
        terminal
            alacritty
                enable
                enableDebugInfo
            kitty.enable
            ghostty.enable
        wayland
            enable
            withSway
            sway.enable
            wofi.enable
            rofi.enable(true by default when wayland is enabled)
            hyprland
                enable
                usePcConfig
                useLaptopConfig
            waybar
                enable(true by default when wayland is enabled)
                usePcConfig
                useLaptopConfig
        gaming
            enable
            withWine
            withTools
        X11
            enable
            i3.enable
            polybar.enable
            rofi.enable
            picom.enable
```

# Rescue from live usb

```bash
lsblk
sudo mount (root partition) /mnt
mkdir -p /mnt/boot
sudo mount -o umask=077 (boot partition) /mnt/boot
cd (nixos configuration folder)
sudo nixos-install --flake .#(output name)
```
