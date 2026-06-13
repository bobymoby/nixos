-- General look & feel, decoration, misc, animations, rules.
-- Translated from settings.conf (hyprlang) to the Hyprland >= 0.55 Lua API.

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 15,
    border_size = 1,
    col = {
      active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
      inactive_border = "0xff444444",
    },
    layout = "master",
  },

  cursor = {
    no_hardware_cursors = true,
  },

  master = {
    new_status = "master",
  },

  misc = {
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    mouse_move_enables_dpms = true,
    -- enable_swallow = true,
    swallow_regex = "^[(Alacritty)|(kitty)]$",
    initial_workspace_tracking = 0,
  },

  decoration = {
    rounding = 15,

    active_opacity = 1.0,
    -- inactive_opacity = 0.9,

    blur = {
      enabled = true,
      size = 4,
      passes = 2,
    },

    shadow = {
      enabled = true,
      -- ignore_window = true,
      offset = "0 0",
      range = 0,
      render_power = 2,
      color = 0x66000000,
    },
  },

  animations = {
    enabled = true,
  },
})

-- Animation curves (old: bezier = name, x0, y0, x1, y1).
hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("smoothOut", { type = "bezier", points = { { 0.36, 0 }, { 0.66, -0.3 } } })
hl.curve("smoothIn", { type = "bezier", points = { { 0.25, 1 }, { 0.5, 1 } } })

-- Animations (old: animation = leaf, on/off, speed, curve, style).
hl.animation({ leaf = "windows", enabled = true, speed = 3, bezier = "overshot", style = "slide" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "smoothOut", style = "slide top" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "smoothIn" })
hl.animation({ leaf = "fadeDim", enabled = true, speed = 3, bezier = "smoothIn" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 3, bezier = "default" })

-- Floating windows get no border (old: windowrule = match:float true, border_size 0).
hl.window_rule({
  name = "no-border-on-floating",
  match = { float = true },
  border_size = 0,
})

-- Waybar xray (old: layerrule = match:namespace waybar, xray on).
hl.layer_rule({
  name = "waybar-xray",
  match = { namespace = "waybar" },
  xray = true,
})
