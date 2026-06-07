-- Window rules
-- https://wiki.hyprland.org/Configuring/Window-Rules/

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
