{ lib, config, ... }:

{
  options.bobymoby.wayland.waybar = {
    enable = lib.mkEnableOption "Enable waybar";
    usePcConfig = lib.mkEnableOption "Use pc configuration";
    useLaptopConfig = lib.mkEnableOption "Use laptop configuration";
  };

  config = lib.mkIf config.bobymoby.wayland.waybar.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      systemd.target = "sway-session.target";
      style = ./style.css;
      settings = [
        {
          height = 15;
          layer = "top";
          position = "top";
          spacing = 15;
          margin-top = 6;
          margin-left = 15;
          margin-right = 15;
          tray = {
            spacing = 10;
          };
          #   modules-center = [ "sway/window" ];
          modules-left = [ "hyprland/workspaces" ];
          modules-right = [
            "tray"
            "pulseaudio"
            "network"
            "temperature"
            "custom/nixpkgs-behind"
          ] ++ (lib.optionals config.bobymoby.wayland.waybar.useLaptopConfig [ "battery" ]) ++ [ "clock" ];

          "hyprland/workspaces" = {
            # format = "{windows}";
            # format-icons = {
            #   "1" = " ";
            #   "9" = "";
            #   "10" = "󰨞";
            # };
            # format = "{icon}{windows}";
            # format-window-separator = " ";
            # window-rewrite-default = "";
            # window-rewrite = {
            #   "title<.*youtube.*>" = ""; # Windows whose titles contain "youtube"
            #   "class<firefox>" = ""; # Windows whose classes are "firefox"
            #   "class<firefox> title<.*github.*>" = ""; # Windows whose class is "firefox" and title contains "github". Note that "class" always comes first.
            #   "foot" = ""; # Windows that contain "foot" in either class or title. For optimization reasons; it will only match against a title if at least one other window explicitly matches against a title.
            #   "code" = "󰨞";
            # };
          };
          battery = {
            format = "{capacity}% {icon}";
            format-alt = "{time} {icon}";
            format-charging = "{capacity}% ";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
            format-plugged = "{capacity}% ";
            states = {
              critical = 15;
              warning = 30;
            };
          };
          clock = {
            format-alt = "{:%d-%m-%Y}";
            tooltip-format = "{:%d-%m-%Y | %H:%M}";
          };
          # cpu = {
          #   format = " {usage}%";
          #   tooltip = false;
          # };
          # memory = { format = " {}%"; };
          network = {
            interval = 1;
            format-alt = "{ifname}: {ipaddr}/{cidr}  up: {bandwidthUpBits} down: {bandwidthDownBits}";
            format-disconnected = "⚠   Disconnected";
            format-ethernet = "   {ifname}: {ipaddr}/{cidr}";
            format-linked = "   {ifname} (No IP)";
            format-wifi = "   {essid} ({signalStrength}%)";
          };
          pulseaudio = {
            format = "{icon}   {volume}%";
            format-bluetooth = "{icon}   {volume}% ";
            format-bluetooth-muted = "{icon}    ";
            format-icons = {
              car = "";
              default = [
                ""
                ""
                ""
              ];
              handsfree = "";
              headphones = "";
              headset = "";
              phone = "";
              portable = "";
            };
            format-muted = " {format_source}";
            format-source = "";
            format-source-muted = "";
            on-click = "pavucontrol";
            ignored-sinks = [
              "Easy Effects Sink"
              "easyeffects_sink"
            ];
          };
          # "sway/mode" = { format = ''<span style="italic">{}</span>''; };
          temperature = {
            critical-threshold = 80;
            thermal-zone = lib.mkIf config.bobymoby.wayland.waybar.useLaptopConfig 7;
            hwmon-path-abs = lib.mkIf config.bobymoby.wayland.waybar.usePcConfig "/sys/devices/pci0000:00/0000:00:18.3/hwmon";
            input-filename = lib.mkIf config.bobymoby.wayland.waybar.usePcConfig "temp1_input";
            format = "{icon}    {temperatureC}°C";
            format-icons = [
              ""
              ""
              ""
            ];
          };
          "custom/nixpkgs-behind" = {
            exec = ./nixpkgs-behind/cmp.sh;
            interval = "once";
            format = "  {}";
            on-click = "xdg-open https://github.com/NixOS/nixpkgs/tree/nixos-unstable";
          };
        }
      ];
    };
  };
}
