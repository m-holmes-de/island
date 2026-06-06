-- Island Appearance — Rose Pine (main/dark)
-- https://wiki.hypr.land/Configuring/Basics/Variables/

-- Rose Pine palette
local colors = {
  base     = "191724",
  surface  = "1f1d2e",
  overlay  = "26233a",
  muted    = "6e6a86",
  subtle   = "908caa",
  text     = "e0def4",
  love     = "eb6f92",
  gold     = "f6c177",
  rose     = "ebbcba",
  pine     = "31748f",
  foam     = "9ccfd8",
  iris     = "c4a7e7",
}

hl.config({
  general = {
    gaps_in = 4,
    gaps_out = 8,
    border_size = 2,

    col = {
      active_border = {
        colors = {
          "rgba(" .. colors.pine .. "ee)",
          "rgba(" .. colors.iris .. "ee)",
        },
        angle = 45,
      },
      inactive_border = "rgba(" .. colors.overlay .. "aa)",
    },

    resize_on_border = false,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 8,

    blur = {
      enabled = true,
      size = 6,
      passes = 2,
      new_optimizations = true,
    },

    shadow = {
      enabled = true,
      range = 12,
      render_power = 3,
      color = "rgba(" .. colors.base .. "ee)",
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    pseudotile = true,
    preserve_split = true,
    force_split = 2,
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    disable_splash_rendering = true,
    focus_on_activate = true,
  },

  cursor = {
    hide_on_key_press = true,
  },
})

-- Animations
hl.curve("easeOut", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })
hl.curve("easeInOut", { type = "bezier", points = { { 0.45, 0 }, { 0.55, 1 } } })
hl.curve("linear", { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "easeOut", style = "popin 80%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.5, bezier = "linear", style = "popin 80%" })
hl.animation({ leaf = "border", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "easeInOut", style = "slide" })
