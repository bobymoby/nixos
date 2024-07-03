{ lib, config, ... }:

{
  options.bobymoby.wayland.waybar.enable = lib.mkEnableOption "Enable waybar";

  config = lib.mkIf config.bobymoby.wayland.waybar.enable {
    programs.waybar = {
      enable = true;
      systemd.enable = true;
      systemd.target = "sway-session.target";
      style = ./style.css;
      settings = [{
        height = 15;
        layer = "top";
        position = "top";
        spacing = 15;
        margin-top = 6;
        margin-left = 15;
        margin-right = 15;
        tray = { spacing = 10; };
        #   modules-center = [ "sway/window" ];
        modules-left = [ "hyprland/workspaces" ];
        modules-right = [
          "tray"
          "pulseaudio"
          "network"
          "temperature"
          "battery"
          "clock"
        ];
        battery = {
          format = "{capacity}% {icon}";
          format-alt = "{time} {icon}";
          format-charging = "{capacity}% ";
          format-icons = [ "" "" "" "" "" ];
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
          format-alt = "{ifname}: {ipaddr}/{cidr}";
          format-disconnected = "⚠   Disconnected";
          format-ethernet = "   {ifname}: {ipaddr}/{cidr}  up: {bandwidthUpBits} down: {bandwidthDownBits}";
          format-linked = "   {ifname} (No IP)";
          format-wifi = "   {essid} ({signalStrength}%)";
        };
        pulseaudio = {
          format = "{icon}   {volume}%";
          format-bluetooth = "{icon}   {volume}% ";
          format-bluetooth-muted = "{icon}    ";
          format-icons = {
            car = "";
            default = [ "" "" "" ];
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
          ignored-sources = [ "Easy Effects Sink" ];
        };
        # "sway/mode" = { format = ''<span style="italic">{}</span>''; };
        temperature = {
          critical-threshold = 80;
          thermal-zone = 7;
          format = "{icon}    {temperatureC}°C";
          format-icons = [ "" "" "" ];
        };
      }];
    };
  };
}
