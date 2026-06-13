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

-- Notification helper scripts (kept as scripts: not config-option toggles).
local mediaScript = "~/.config/hypr/scripts/media.sh"

-- The following used to be separate .sh files that shelled out to `hyprctl`.
-- They are now native Lua callbacks using Hyprland's API (hl.get_config /
-- hl.config to read & flip config options, hl.get_active_window + hl.dispatch
-- for window state). The "restore" branches mirror common/settings.lua.

-- Game mode (old disable-animations.sh): strip eye-candy for performance, then
-- restore the configured look.
local function gameModeToggle()
  if hl.get_config("animations.enabled") then
    hl.config({
      animations = { enabled = false },
      general = { gaps_in = 0, gaps_out = 0, border_size = 1 },
      decoration = { rounding = 0, blur = { enabled = false }, shadow = { enabled = false } },
    })
  else
    hl.config({
      animations = { enabled = true },
      general = { gaps_in = 5, gaps_out = 15, border_size = 1 },
      decoration = { rounding = 15, blur = { enabled = true }, shadow = { enabled = true } },
    })
  end
end

-- Hide all windows (old hide-all.sh): drop every window to zero opacity, then
-- restore full opacity.
local function hideAllToggle()
  if hl.get_config("decoration.active_opacity") == 1.0 then
    hl.config({ decoration = { active_opacity = 0.0, inactive_opacity = 0.0 } })
  else
    hl.config({ decoration = { active_opacity = 1.0, inactive_opacity = 1.0 } })
  end
end

-- killactive (old killactive.sh): never close a window on a special workspace
-- (negative id) so scratchpads aren't killed by accident.
local function killActive()
  local w = hl.get_active_window()
  if w ~= nil and w.workspace ~= nil and w.workspace.id >= 0 then
    hl.dispatch(hl.dsp.window.close())
  end
end

-- movetoworkspace (old move-to-workspace.sh): refuse to drag a window out of a
-- special workspace, except special:magic. Returns the per-workspace callback.
local function moveToWorkspace(ws)
  return function()
    local w = hl.get_active_window()
    if w == nil then
      return
    end
    if w.workspace ~= nil and w.workspace.id < 0 and w.workspace.name ~= "special:magic" then
      return
    end
    hl.dispatch(hl.dsp.window.move({ workspace = ws }))
  end
end

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd(windowsList))
-- hl.bind(mainMod .. " + A", hl.dsp.global("hyprexpo:expo")) -- toggle

hl.bind(mainMod .. " + ESCAPE", hl.dsp.exec_cmd(shutdownMenu))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))

hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("loginctl lock-session"))

-- Hyprland specific
hl.bind(mainMod .. " + SHIFT + Q", killActive)
hl.bind(mainMod .. " + CTRL + SHIFT + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exit())
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("hyprctl reload"))
hl.bind(mainMod .. " + SHIFT + O", gameModeToggle)
hl.bind(mainMod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + M", hl.dsp.layout("swapwithmaster master"))
hl.bind(mainMod .. " + L", hideAllToggle)

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
  hl.bind(mainMod .. " + CTRL + SHIFT + " .. key, hl.dsp.window.move({ workspace = ws }))
  hl.bind(mainMod .. " + SHIFT + " .. key, moveToWorkspace(ws))
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
