-- Island Keybindings
-- https://wiki.hyprland.org/Configuring/Binds/
-- SUPER = Windows/Meta key

-- === Application Launchers ===
island.bind("SUPER + RETURN", "Terminal", "ghostty")
island.bind("SUPER + SPACE", "App launcher", "rofi -show drun -show-icons")
island.bind("SUPER + B", "Browser", "firefox")
island.bind("SUPER + E", "File manager", "thunar")
island.bind("SUPER + V", "Clipboard history", "cliphist list | rofi -dmenu | cliphist decode | wl-copy")

island.bind("SUPER + W", "Wallpaper selector", "island-wallpaper-select")

-- === TUI Launchers ===
island.bind("SUPER + N", "Network (impala)", island.tui("impala"))
island.bind("SUPER + O", "Bluetooth (bluetui)", island.tui("bluetui"))
island.bind("SUPER + A", "Audio (pulsemixer)", island.tui("pulsemixer"))
island.bind("SUPER + M", "System monitor (btop)", island.tui("btop"))

-- === Window Management ===
island.bind("SUPER + Q", "Close window", hl.dsp.window.close())
island.bind("SUPER + F", "Fullscreen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
island.bind("SUPER + SHIFT + F", "Maximized", hl.dsp.window.fullscreen({ mode = "maximized" }))
island.bind("SUPER + T", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
island.bind("SUPER + P", "Pseudo tile", hl.dsp.window.pseudo())
island.bind("SUPER + J", "Toggle split", hl.dsp.layout("togglesplit"))

-- === Focus Movement (vim-style + arrows) ===
island.bind("SUPER + H", "Focus left", hl.dsp.focus({ direction = "l" }))
island.bind("SUPER + L", "Focus right", hl.dsp.focus({ direction = "r" }))
island.bind("SUPER + K", "Focus up", hl.dsp.focus({ direction = "u" }))
island.bind("SUPER + LEFT", "Focus left", hl.dsp.focus({ direction = "l" }))
island.bind("SUPER + RIGHT", "Focus right", hl.dsp.focus({ direction = "r" }))
island.bind("SUPER + UP", "Focus up", hl.dsp.focus({ direction = "u" }))
island.bind("SUPER + DOWN", "Focus down", hl.dsp.focus({ direction = "d" }))

-- === Window Movement ===
island.bind("SUPER + SHIFT + H", "Move window left", hl.dsp.window.swap({ direction = "l" }))
island.bind("SUPER + SHIFT + L", "Move window right", hl.dsp.window.swap({ direction = "r" }))
island.bind("SUPER + SHIFT + K", "Move window up", hl.dsp.window.swap({ direction = "u" }))
island.bind("SUPER + SHIFT + J", "Move window down", hl.dsp.window.swap({ direction = "d" }))
island.bind("SUPER + SHIFT + LEFT", "Move window left", hl.dsp.window.swap({ direction = "l" }))
island.bind("SUPER + SHIFT + RIGHT", "Move window right", hl.dsp.window.swap({ direction = "r" }))
island.bind("SUPER + SHIFT + UP", "Move window up", hl.dsp.window.swap({ direction = "u" }))
island.bind("SUPER + SHIFT + DOWN", "Move window down", hl.dsp.window.swap({ direction = "d" }))

-- === Window Resize ===
island.bind("SUPER + CTRL + H", "Shrink width", hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
island.bind("SUPER + CTRL + L", "Grow width", hl.dsp.window.resize({ x = 40, y = 0, relative = true }))
island.bind("SUPER + CTRL + K", "Shrink height", hl.dsp.window.resize({ x = 0, y = -40, relative = true }))
island.bind("SUPER + CTRL + J", "Grow height", hl.dsp.window.resize({ x = 0, y = 40, relative = true }))

-- === Workspaces ===
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  island.bind("SUPER + " .. key, "Workspace " .. workspace, hl.dsp.focus({ workspace = tostring(workspace) }))
  island.bind("SUPER + SHIFT + " .. key, "Move to workspace " .. workspace, hl.dsp.window.move({ workspace = tostring(workspace) }))
  island.bind("SUPER + SHIFT + ALT + " .. key, "Move silently to workspace " .. workspace, hl.dsp.window.move({ workspace = tostring(workspace), follow = false }))
end

-- === Workspace Navigation ===
island.bind("SUPER + TAB", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
island.bind("SUPER + SHIFT + TAB", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))

-- === Scratchpad ===
island.bind("SUPER + S", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
island.bind("SUPER + SHIFT + S", "Move to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

-- === Mouse Bindings ===
island.bind("SUPER + mouse_down", "Scroll workspace forward", hl.dsp.focus({ workspace = "e+1" }))
island.bind("SUPER + mouse_up", "Scroll workspace backward", hl.dsp.focus({ workspace = "e-1" }))
island.bind("SUPER + mouse:272", "Move window", hl.dsp.window.drag(), { mouse = true })
island.bind("SUPER + mouse:273", "Resize window", hl.dsp.window.resize(), { mouse = true })

-- === Alt-Tab ===
island.bind("ALT + TAB", "Next window", hl.dsp.window.cycle_next())
island.bind("ALT + TAB", "Bring to top", hl.dsp.window.bring_to_top())
island.bind("ALT + SHIFT + TAB", "Previous window", hl.dsp.window.cycle_next({ next = false }))
island.bind("ALT + SHIFT + TAB", "Bring to top", hl.dsp.window.bring_to_top())

-- === Screenshots ===
island.bind("Print", "Screenshot (region)", 'grim -g "$(slurp -d)" - | satty --filename -')
island.bind("SHIFT + Print", "Screenshot (full)", "grim - | satty --filename -")
island.bind("SUPER + Print", "Screenshot to clipboard", 'grim -g "$(slurp -d)" - | wl-copy')

-- === Media Keys ===
island.bind("XF86AudioRaiseVolume", nil, "pamixer -i 5", { locked = true, repeating = true })
island.bind("XF86AudioLowerVolume", nil, "pamixer -d 5", { locked = true, repeating = true })
island.bind("XF86AudioMute", nil, "pamixer -t", { locked = true })
island.bind("XF86AudioMicMute", nil, "pamixer --default-source -t", { locked = true })
island.bind("XF86MonBrightnessUp", nil, "brightnessctl set +5%", { locked = true, repeating = true })
island.bind("XF86MonBrightnessDown", nil, "brightnessctl set 5%-", { locked = true, repeating = true })
island.bind("XF86AudioPlay", nil, "playerctl play-pause", { locked = true })
island.bind("XF86AudioNext", nil, "playerctl next", { locked = true })
island.bind("XF86AudioPrev", nil, "playerctl previous", { locked = true })

-- === System ===
island.bind("SUPER + ESCAPE", "Lock screen", "hyprlock")
island.bind("SUPER + SHIFT + Q", "Exit Hyprland", hl.dsp.exec_cmd("hyprctl dispatch exit"))
island.bind("SUPER + SHIFT + R", "Toggle waybar", "island-toggle-waybar")
island.bind("SUPER + SHIFT + W", "Reload Hyprland config", hl.dsp.exec_cmd("hyprctl reload"))
