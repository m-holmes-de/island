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

### ~~Neovim Configuration~~ — Done
LazyVim-based with Rose Pine main variant. Config in `config/nvim/`.

### ~~Tmux Configuration~~ — Done
Rose Pine themed, Ctrl+Space prefix, vi mode, TPM plugins. Config in `config/tmux/`.

### ~~ZSH Configuration~~ — Done
Zinit plugins, starship prompt, vi mode, fzf, zoxide. Config in `default/.zshrc`.

## Future Ideas

- DankMaterialShell / Quickshell as waybar replacement (once Quickshell hits 1.0)
- Power menu (shutdown/reboot/suspend/logout via rofi)
- Update system (self-update from git + run migrations)
- Hook system for user-defined post-boot/post-update actions
- Display/monitor management TUI
