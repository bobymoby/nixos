-- PC-specific config. Translated from specific/pc/hyprland.conf.

hl.monitor({ output = "DP-2", mode = "preferred", position = "-1920x-120", scale = "1" })
hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = "1" })
-- hl.monitor({ output = "DP-3", mode = "preferred", position = "1920x-120", scale = "1" })

hl.workspace_rule({ workspace = "1", monitor = "HDMI-A-1", default = true })
hl.workspace_rule({ workspace = "2", monitor = "DP-2", default = true })
-- hl.workspace_rule({ workspace = "3", monitor = "DP-3", default = true })

hl.on("hyprland.start", function()
  hl.exec_cmd(
    "swww-daemon & sleep 1"
      .. " && swww img -o \"DP-2\" ~/.config/hypr/assets/gradient.png"
      .. " && swww img -o \"HDMI-A-1\" ~/.config/hypr/assets/gradient-2.png"
  )
  hl.exec_cmd("hyprlock")
end)
