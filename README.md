# First build

`sudo nano /etc/nixos/configuration.nix`

Add these lines:

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

-   ````bash
    sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
    sudo nix-channel --update
    ```run this in order to fix command-not-found bug with flakes
    ````
-   `sudo nixos-rebuild switch`
-   `sudo mv /etc/nixos ~/nixos`
-   `sudo git clone https://github.com/bobymoby/nixos /etc/nixos`
-   `sudo chown -R bobymoby /etc/nixos`

Fix `/etc/nixos/nixos/hardware-configuration.nix` - get the ids from `~/nixos/hardware-configuration.nix`

Run

-   ```bash
    nix build --no-link .#homeConfigurations.bobymoby@Bobi<Laptop>NixOS.activationPackage
    "$(nix path-info .#homeConfigurations.bobymoby@Bobi<Laptop>NixOS.activationPackage)"/activate
    ```
-   ```bash
    nh os switch
    nh home switch
    ```
-   `reboot`
-   `sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo`
-   load easyeffects preset

# Current fs setup

-   boot - `1GiB FAT32` flagged with `boot` and mounted on `/boot` shared with Windows
-   swap - `35044MiB linuxswap` flagged with `swap`
-   root - flagged with `root` and mounted on `/`
-   windowsC - ntfs volume mounted on `/windowsC`

# Windows setup

-   Do the steps from this answer and it's comments: https://askubuntu.com/a/1251469 https://forums.linuxmint.com/viewtopic.php?t=344835

# Useful commands

-   `nh os switch -u`
-   `nh home switch`
-   `nh clean all`

# Known issues

-   command-not-found might not work even after running setup-scripts. It is currently not supported with flakes
-   X sometimes hangs after suspend and closes all windows. https://github.com/NVIDIA/open-gpu-kernel-modules/issues/472
