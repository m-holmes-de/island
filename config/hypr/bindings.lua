-- Island Keybindings
-- https://wiki.hyprland.org/Configuring/Binds/
--
-- HYPER = CapsLock (hold) = Super+Ctrl (via kanata)
-- SUPER = Windows/Meta key (fallback when kanata not running)
-- NOTE: Alt removed from Hyper to avoid Ctrl+Alt = AltGr conflict on German layout

local HYPER = "SUPER + CTRL"

-- === Application Launchers ===
island.bind(HYPER .. " + RETURN", "Terminal", "ghostty")
island.bind(HYPER .. " + SPACE", "App launcher", "rofi -show drun -show-icons")
island.bind(HYPER .. " + B", "Browser", "firefox")
island.bind(HYPER .. " + E", "File manager (Thunar)", "thunar")
island.bind(HYPER .. " + Y", "File manager (yazi)", island.tui("yazi"))
island.bind(HYPER .. " + V", "Clipboard history", "cliphist list | rofi -dmenu | cliphist decode | wl-copy")
island.bind(HYPER .. " + W", "Wallpaper selector", "island-wallpaper-select")
island.bind(HYPER .. " + I", "Keybindings", "island-keybindings")
island.bind(HYPER .. " + SHIFT + T", "Theme selector", "island-theme-select")

-- === TUI Launchers ===
island.bind(HYPER .. " + N", "Network (impala)", island.tui("impala"))
island.bind(HYPER .. " + O", "Bluetooth (bluetui)", island.tui("bluetui"))
island.bind(HYPER .. " + A", "Audio (pulsemixer)", island.tui("pulsemixer"))
island.bind(HYPER .. " + X", "System monitor (btop)", island.tui("btop"))

-- === Window Management ===
island.bind(HYPER .. " + Q", "Close window", hl.dsp.window.close())
island.bind(HYPER .. " + M", "Maximize", hl.dsp.window.fullscreen({ mode = "maximized" }))
island.bind(HYPER .. " + T", "Toggle floating", hl.dsp.window.float({ action = "toggle" }))
island.bind(HYPER .. " + P", "Pseudo tile", hl.dsp.window.pseudo())
island.bind(HYPER .. " + J", "Toggle split", hl.dsp.layout("togglesplit"))

-- === Focus Movement (vim-style + arrows) ===
island.bind(HYPER .. " + H", "Focus left", hl.dsp.focus({ direction = "l" }))
island.bind(HYPER .. " + L", "Focus right", hl.dsp.focus({ direction = "r" }))
island.bind(HYPER .. " + K", "Focus up", hl.dsp.focus({ direction = "u" }))
island.bind(HYPER .. " + LEFT", "Focus left", hl.dsp.focus({ direction = "l" }))
island.bind(HYPER .. " + RIGHT", "Focus right", hl.dsp.focus({ direction = "r" }))
island.bind(HYPER .. " + UP", "Focus up", hl.dsp.focus({ direction = "u" }))
island.bind(HYPER .. " + DOWN", "Focus down", hl.dsp.focus({ direction = "d" }))

-- === Window Movement ===
island.bind(HYPER .. " + SHIFT + H", "Move window left", hl.dsp.window.swap({ direction = "l" }))
island.bind(HYPER .. " + SHIFT + L", "Move window right", hl.dsp.window.swap({ direction = "r" }))
island.bind(HYPER .. " + SHIFT + K", "Move window up", hl.dsp.window.swap({ direction = "u" }))
island.bind(HYPER .. " + SHIFT + J", "Move window down", hl.dsp.window.swap({ direction = "d" }))
island.bind(HYPER .. " + SHIFT + LEFT", "Move window left", hl.dsp.window.swap({ direction = "l" }))
island.bind(HYPER .. " + SHIFT + RIGHT", "Move window right", hl.dsp.window.swap({ direction = "r" }))
island.bind(HYPER .. " + SHIFT + UP", "Move window up", hl.dsp.window.swap({ direction = "u" }))
island.bind(HYPER .. " + SHIFT + DOWN", "Move window down", hl.dsp.window.swap({ direction = "d" }))

-- === Window Resize ===
island.bind(HYPER .. " + MINUS", "Shrink window", hl.dsp.window.resize({ x = -60, y = -60, relative = true }))
island.bind(HYPER .. " + EQUAL", "Grow window", hl.dsp.window.resize({ x = 60, y = 60, relative = true }))
island.bind(HYPER .. " + ALT + H", "Shrink width", hl.dsp.window.resize({ x = -40, y = 0, relative = true }))
island.bind(HYPER .. " + ALT + L", "Grow width", hl.dsp.window.resize({ x = 40, y = 0, relative = true }))
island.bind(HYPER .. " + ALT + K", "Shrink height", hl.dsp.window.resize({ x = 0, y = -40, relative = true }))
island.bind(HYPER .. " + ALT + J", "Grow height", hl.dsp.window.resize({ x = 0, y = 40, relative = true }))

-- === Workspaces ===
-- Use keysym names to avoid German layout issues with code: + SHIFT
local ws_keys = { "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }
for workspace = 1, 10 do
  local key = ws_keys[workspace]
  island.bind(HYPER .. " + " .. key, "Workspace " .. workspace, hl.dsp.focus({ workspace = tostring(workspace) }))
  island.bind(HYPER .. " + SHIFT + " .. key, "Move to workspace " .. workspace, hl.dsp.window.move({ workspace = tostring(workspace) }))
end

-- === Workspace Navigation ===
island.bind(HYPER .. " + TAB", "Next workspace", hl.dsp.focus({ workspace = "e+1" }))
island.bind(HYPER .. " + SHIFT + TAB", "Previous workspace", hl.dsp.focus({ workspace = "e-1" }))

-- === Scratchpad ===
island.bind(HYPER .. " + S", "Toggle scratchpad", hl.dsp.workspace.toggle_special("scratchpad"))
island.bind(HYPER .. " + SHIFT + S", "Move to scratchpad", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }))

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

-- === Screenshots & Recording ===
island.bind("Print", "Screenshot (region)", "island-capture-screenshot region")
island.bind("SHIFT + Print", "Screenshot (full)", "island-capture-screenshot full")
island.bind(HYPER .. " + Print", "Screenshot to clipboard", "island-capture-screenshot clipboard")
island.bind(HYPER .. " + SHIFT + Print", "Toggle recording (region)", "island-capture-recording region")
island.bind("CTRL + SHIFT + Print", "Toggle recording (full)", "island-capture-recording full")

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
island.bind(HYPER .. " + ESCAPE", "Lock screen", "hyprlock")
island.bind(HYPER .. " + SHIFT + Q", "Exit Hyprland", hl.dsp.exec_cmd("hyprctl dispatch exit"))
island.bind(HYPER .. " + SHIFT + R", "Toggle waybar", "island-toggle-waybar")
island.bind(HYPER .. " + SHIFT + W", "Reload Hyprland config", hl.dsp.exec_cmd("hyprctl reload"))
