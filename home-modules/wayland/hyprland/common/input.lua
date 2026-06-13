-- Input, gestures and keyboard-layout switching.
-- Translated from input.conf.

hl.config({
  input = {
    kb_layout = "us,bg",
    kb_variant = "altgr-intl,phonetic",
    -- kb_options = "grp:alt_shift_toggle",

    follow_mouse = 1,

    sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

    touchpad = {
      natural_scroll = true,
      disable_while_typing = false,
    },
  },
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

hl.bind("ALT + Shift_L", hl.dsp.exec_cmd("hyprctl switchxkblayout main next"), { locked = true })
