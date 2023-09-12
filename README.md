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

-   `sudo nixos-rebuild switch`
-   `sudo mv /etc/nixos ~/nixos`
-   `sudo git clone https://github.com/bobymoby/nixos /etc/nixos`
-   `sudo chown \<username> /etc/nixos`

Fix `/etc/nixos/nixos/hardware-configuration.nix` - get the ids from `~/nixos/hardware-configuration.nix`

`cd /etc/nixos`

Run

-   `chmod +x build.sh rebuild.sh rebuild-hm.sh ./setup-scripts/setup-channel.sh ./setup-flatpak.sh`
-   `./build.sh`
-   `./rebuild-hm.sh`
-   `./rebuild.sh`
-   `reboot`
-   setup-scripts
-   open chrome: `chrome://settings/appearance` and click `Use GTK`(will be automated in future commits)

# Current fs setup

-   boot - `512MiB FAT32` flagged with `boot` and mounted on `/boot`
-   swap - `35044MiB linuxswap` flagged with `swap`
-   root - `btrfs` flagged with `root` and mounted on `/`

# Known issues

-   command-not-found might not work even after running setup-scripts. It is currently not supported with flakes

```sh

```
