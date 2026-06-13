-- Keybindings. Translated from binds.conf.
-- `terminalClean` is a global injected at the top of hyprland.lua by Home Manager.

local mainMod = "SUPER" -- Windows button

local terminal = terminalClean .. " -e $SHELL -c 'fastfetch && $SHELL'"
local fileManager = "nemo"
local menu = "rofi -modi drun -show drun -show-icons -theme ~/.config/rofi/launcher.rasi -scroll-method 1"
local windowsList = "rofi -show window -normal-window -show-icons -theme ~/.config/rofi/launcher.rasi -scroll-method 1"
local shutdownMenu =
  "rofi -normal-window -show power-menu -modi \"power-menu:~/.config/rofi/rofi-power-menu.sh --choices=shutdown/suspend/reboot\" -theme ~/.config/rofi/launcher.rasi -scroll-method 1"
local cliphist = "cliphist list | rofi -dmenu -theme ~/.config/rofi/launcher.rasi -scroll-method 1 | cliphist decode | wl-copy"

-- Scripts (old: scripts.conf).
local movetoworkspaceScript = "~/.config/hypr/scripts/move-to-workspace.sh"
local mediaScript = "~/.config/hypr/scripts/media.sh"
local killactiveScript = "~/.config/hypr/scripts/killactive.sh"
local disableAnimationsScript = "~/.config/hypr/scripts/disable-animations.sh"
local hideallScript = "~/.config/hypr/scripts/hide-all.sh"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd(windowsList))
-- hl.bind(mainMod .. " + A", hl.dsp.global("hyprexpo:expo")) -- toggle

hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(shutdownMenu))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("loginctl lock-session"))

-- Hyprland specific
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd(killactiveScript))
hl.bind(mainMod .. " + CTRL + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + O", hl.dsp.exec_cmd(disableAnimationsScript))
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + M", hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + L", hl.dsp.exec_cmd(hideallScript))

-- Move/resize
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + ALT_L", hl.dsp.window.resize(), { mouse = true })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + left", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + up", hl.dsp.window.resize({ x = 0, y = -10, relative = true }), { repeating = true })
hl.bind(mainMod .. " + CTRL + down", hl.dsp.window.resize({ x = 0, y = 10, relative = true }), { repeating = true })

-- Media keys
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(mediaScript .. " --inc"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(mediaScript .. " --dec"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(mediaScript .. " --toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause -p spotify"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

-- Multi monitor binds
hl.bind(mainMod .. " + SHIFT + left", hl.dsp.window.move({ monitor = "l" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.window.move({ monitor = "r" }))
hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind(mainMod .. " + SHIFT + period", hl.dsp.workspace.move({ monitor = "r" }))

-- Move focus with arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

-- Workspaces. Plain: focus. SHIFT: move via script. CTRL+SHIFT: force move.
local function workspaceBinds(key, ws)
  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = ws }))
  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.exec_cmd(movetoworkspaceScript .. " " .. ws))
  hl.bind(mainMod .. " + CTRL + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws }))
end

for i = 1, 9 do
  workspaceBinds(tostring(i), i)
end
workspaceBinds("0", 10)
for i = 1, 4 do
  workspaceBinds("F" .. i, 10 + i)
end

-- Toggle special workspaces
hl.bind("CTRL + SHIFT + ESCAPE", hl.dsp.workspace.toggle_special("sysmonitor"))
hl.bind(mainMod .. " + N", hl.dsp.workspace.toggle_special("notes"))
hl.bind(mainMod .. " + T", hl.dsp.workspace.toggle_special("terminal"))
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + W", hl.dsp.workspace.toggle_special("webcord"))
-- hl.bind(mainMod .. " + V", hl.dsp.workspace.toggle_special("magic"))

-- Force move window to special workspace
hl.bind(mainMod .. " + CTRL + SHIFT + ESCAPE", hl.dsp.window.move({ workspace = "special:sysmonitor" }))
hl.bind(mainMod .. " + CTRL + SHIFT + N", hl.dsp.window.move({ workspace = "special:notes" }))
hl.bind(mainMod .. " + CTRL + SHIFT + T", hl.dsp.window.move({ workspace = "special:terminal" }))
hl.bind(mainMod .. " + CTRL + SHIFT + S", hl.dsp.window.move({ workspace = "special:music" }))
hl.bind(mainMod .. " + CTRL + SHIFT + W", hl.dsp.window.move({ workspace = "special:webcord" }))
hl.bind(mainMod .. " + CTRL + SHIFT + V", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + V", hl.dsp.exec_cmd(cliphist))
