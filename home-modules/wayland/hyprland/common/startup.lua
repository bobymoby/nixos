-- Autostart. Translated from startup.conf (old: exec-once).
-- `terminalClean` is a global injected at the top of hyprland.lua.

hl.on("hyprland.start", function()
  hl.exec_cmd(
    "dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      .. " && systemctl --user stop hyprland-session.target"
      .. " && systemctl --user start hyprland-session.target"
  )

  hl.exec_cmd("easyeffects --gapplication-service -l preset2")

  hl.exec_cmd("nm-applet")
  hl.exec_cmd("blueman-applet")

  hl.exec_cmd("waybar")

  hl.exec_cmd("awww-daemon & sleep 1 && awww clear 800cab")

  hl.exec_cmd("wl-paste --type text --watch cliphist store")
  hl.exec_cmd("wl-paste --type image --watch cliphist store")

  hl.exec_cmd("obsidian", { workspace = "special:notes silent" })
  hl.exec_cmd(terminalClean .. " -e btop", { workspace = "special:sysmonitor silent" })
  hl.exec_cmd(terminalClean, { workspace = "special:terminal silent" })
  hl.exec_cmd("spotify", { workspace = "special:music silent" })
end)
