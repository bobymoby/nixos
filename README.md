# First build

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
```

Run:

-   ```bash
    sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
    sudo nix-channel --update
    sudo nixos-rebuild switch
    sudo mv /etc/nixos ~/nixos
    sudo git clone https://github.com/bobymoby/nixos /etc/nixos
    sudo chown -R bobymoby /etc/nixos
    ```

Fix `hardware-configuration.nix` - get the ids from `~/nixos/hardware-configuration.nix`

Run

-   ```bash
    nix build --no-link .#homeConfigurations.bobymoby@Bobi<Laptop>NixOS.activationPackage
    "$(nix path-info .#homeConfigurations.bobymoby@Bobi<Laptop>NixOS.activationPackage)"/activate
    nh os switch
    nh home switch
    sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    reboot
    ```
-   load easyeffects preset(should not be necessary after latest commits)

# Current fs setup

-   boot - `1GiB FAT32` flagged with `boot` and mounted on `/boot` shared with Windows
-   swap - `35044MiB linuxswap` flagged with `swap`
-   root - flagged with `root` and mounted on `/`
-   windowsC - ntfs volume mounted on `/windowsC`

# Windows setup

-   Do the steps from this answer and it's comments: https://askubuntu.com/a/1251469 https://forums.linuxmint.com/viewtopic.php?t=344835.

# Known issues

-   command-not-found might not work even after running setup-scripts. https://github.com/NixOS/nixpkgs/issues/171054
-   X sometimes hangs after suspend and closes all windows. https://github.com/NVIDIA/open-gpu-kernel-modules/issues/472
-   Chromium-based/Electron apps have problems with resizing. https://github.com/hyprwm/Hyprland/issues/6552 https://github.com/hyprwm/Hyprland/issues/1462
-   Gruvbox theme nixpkgs package does not provide some of the themes. https://github.com/NixOS/nixpkgs/issues/323833
-   Sound device idling causes a pop sound. Might be fixed in some of the latest commits. Requires further testing.
-   Wifi sometimes does not work after using windows due to a windows issue.
