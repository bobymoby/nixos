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
];
```

Run:

-   run `setup-scripts/setup-channel.sh` in order to fix command-not-found bug with flakes
-   `sudo nixos-rebuild switch`
-   `sudo mv /etc/nixos ~/nixos`
-   `sudo git clone https://github.com/bobymoby/nixos /etc/nixos`
-   `sudo chown -R bobymoby /etc/nixos`

Fix `/etc/nixos/nixos/hardware-configuration.nix` - get the ids from `~/nixos/hardware-configuration.nix`

Run

-   `chmod +x build.sh rebuild.sh rebuild-hm.sh update.sh ./setup-scripts/setup-channel.sh ./setup-flatpak.sh`
-   `./build.sh`
-   `./rebuild-hm.sh`
-   `./rebuild.sh`
-   `reboot`
-   setup-scripts
-   load easyeffects preset

# Current fs setup

-   boot - `1GiB FAT32` flagged with `boot` and mounted on `/boot` shared with Windows
-   swap - `35044MiB linuxswap` flagged with `swap`
-   root - flagged with `root` and mounted on `/`

# Known issues

-   command-not-found might not work even after running setup-scripts. It is currently not supported with flakes
-   X sometimes hangs after suspend and closes all windows. https://github.com/NVIDIA/open-gpu-kernel-modules/issues/472
