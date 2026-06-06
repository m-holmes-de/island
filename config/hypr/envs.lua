-- Island environment variables
-- https://wiki.hyprland.org/Configuring/Variables/#environment

local home = os.getenv("HOME")
local island_path = home .. "/.local/share/island"

-- Make island commands available to keybindings
hl.env("ISLAND_PATH", island_path)
hl.env("PATH", island_path .. "/bin:" .. (os.getenv("PATH") or ""))

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- Wayland
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
