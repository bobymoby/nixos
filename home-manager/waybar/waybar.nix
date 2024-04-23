{ ... }:

{
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
      modules-left = [ "sway/workspaces" "sway/mode" ];
      modules-center = [ "sway/window" ];
      modules-right = [
        "tray"
        "pulseaudio"
        "network"
        "cpu"
        "memory"
        "temperature"
        "battery"
        "clock"
      ];
      battery = {
        format = "{capacity}% {icon} ";
        format-alt = "{time} {icon} ";
        format-charging = "{capacity}%  ";
        format-icons = [ "" "" "" "" "" ];
        format-plugged = "{capacity}%  ";
        states = {
          critical = 15;
          warning = 30;
        };
      };
      clock = {
        format-alt = "{:%d-%m-%Y}";
        tooltip-format = "{:%d-%m-%Y | %H:%M}";
      };
      cpu = {
        format = "   {usage}%";
        tooltip = false;
      };
      memory = { format = "   {}%"; };
      network = {
        interval = 1;
        format-alt = "{ifname}: {ipaddr}/{cidr}";
        format-disconnected = "⚠ Disconnected";
        format-ethernet = "   {ifname}: {ipaddr}/{cidr}  up: {bandwidthUpBits} down: {bandwidthDownBits}";
        format-linked = "   {ifname} (No IP)";
        format-wifi = "   {essid} ({signalStrength}%)";
      };
      pulseaudio = {
        format = "{icon}   {volume}% {format_source}";
        format-bluetooth = "{icon}  {volume}%  {format_source}";
        format-bluetooth-muted = "{icon}      {format_source}";
        format-icons = {
          car = "";
          default = [ "" "" "" ];
          handsfree = "";
          headphones = "";
          headset = "";
          phone = "";
          portable = "";
        };
        format-muted = "  {format_source}";
        format-source = "  {volume}%";
        format-source-muted = "";
        on-click = "pavucontrol";
      };
      "sway/mode" = { format = ''<span style="italic">{}</span>''; };
      "sway/window" = {
        tooltip = false;
      };
      temperature = {
        critical-threshold = 80;
        format = "{temperatureC}°C";
        thermal-zone = 7;
      };
    }];
  };
}
