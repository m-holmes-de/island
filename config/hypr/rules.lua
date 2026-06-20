-- Window & layer rules
-- https://wiki.hyprland.org/Configuring/Window-Rules/

-- Rofi — frosted glass with xray blur
hl.layer_rule({ match = { namespace = "rofi" }, blur = true, xray = 1, ignore_alpha = 0.3 })

-- wlogout — blurred overlay
hl.layer_rule({ match = { namespace = "wlogout" }, blur = true, ignore_alpha = 0.3 })

-- TUI apps (opened via island.tui) — floating, centered
island.window({ title = "^Island TUI$" }, { float = true, center = true, size = { 900, 600 } })

-- Float common dialogs
island.window("pavucontrol", { float = true })
island.window("pulsemixer", { float = true })
island.window("blueman-manager", { float = true })
island.window("nm-connection-editor", { float = true })
island.window("com.gabm.satty", { float = true })

island.window({ title = "Picture-in-Picture" }, { float = true, pin = true })
island.window({ title = "Open File" }, { float = true })
island.window({ title = "Save As" }, { float = true })
island.window({ title = "File Operation Progress" }, { float = true })
island.window({ title = "Confirm" }, { float = true })
