# Island Roadmap

## Phase 2 — Planned Features

### ~~Clipboard Manager~~ — Done
Using `cliphist` with rofi (SUPER+V).

### ~~Screenshots & Screen Recording~~ — Done
Screenshots via `island-capture-screenshot` (grim + slurp + satty).
Recording via `island-capture-recording` (wf-recorder) with waybar indicator.

### ~~Keybinding Viewer~~ — Done
Rofi-based viewer parsing bindings.lua. SUPER+/ to open.

### Theme Management
- Switchable color schemes (Rose Pine, Catppuccin, Tokyo Night, etc.)
- Theme switching should update: Hyprland borders, Waybar, Rofi, Mako, Ghostty, Hyprlock, tmux, Neovim
- Consider [matugen](https://github.com/InioX/matugen) for wallpaper-based color generation

### Neovim Configuration
- Based on [LazyVim](https://www.lazyvim.org/) distribution
- Themed to match current Island color scheme
- Config lives in `config/nvim/`

### Tmux Configuration
- Based on user's current tmux config
- Themed to match current Island color scheme
- Config lives in `config/tmux/`

## Future Ideas

- DankMaterialShell / Quickshell as waybar replacement (once Quickshell hits 1.0)
- Power menu (shutdown/reboot/suspend/logout via rofi)
- Update system (self-update from git + run migrations)
- Hook system for user-defined post-boot/post-update actions
- Display/monitor management TUI
