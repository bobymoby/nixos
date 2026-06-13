-- Laptop-specific config. Translated from specific/laptop/hyprland.conf.

local backlightScript = "~/.config/hypr/scripts/backlight.sh"

hl.monitor({ output = "eDP-1", mode = "preferred", position = "auto", scale = "1" })
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "1", mirror = "eDP-1" })

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(backlightScript .. " --inc"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(backlightScript .. " --dec"), { locked = true, repeating = true })

hl.config({
  decoration = {
    inactive_opacity = 0.9,
  },
})

hl.on("hyprland.start", function()
  hl.exec_cmd("swww-daemon & sleep 1 && swww img ~/.config/hypr/assets/gradient-2.png")
  hl.exec_cmd("hypridle")
  -- hl.exec_cmd("hyprlock")
end)
