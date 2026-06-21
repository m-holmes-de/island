-- Monitor configuration
-- https://wiki.hyprland.org/Configuring/Monitors/

-- Laptop display
hl.monitor({ output = "eDP-1", mode = "3456x2160@60", position = "auto", scale = "2" })

-- MSI MAG321UX OLED (external)
hl.monitor({ output = "DP-4", mode = "3840x2160@60", position = "auto", scale = "1.5" })

-- Fallback for any other monitor
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })
