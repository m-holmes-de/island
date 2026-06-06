# Island Roadmap

## Phase 2 — Planned Features

### Clipboard Manager
- Visual clipboard manager UI (beyond `cliphist list | rofi -dmenu`)
- Consider [clipman](https://github.com/chmouel/clipman) or [clipse](https://github.com/savedra1/clipse) for a TUI approach
- Should support text and images

### Screenshots & Screen Recording
- Current: grim + slurp + satty for screenshots
- Add screen recording (video clips) — consider [wf-recorder](https://github.com/ammen99/wf-recorder) or [gpu-screen-recorder](https://git.dec05eba.com/gpu-screen-recorder/about/)
- Waybar indicator when recording
- Ensure copy/paste of screenshots into terminal works (wl-clipboard integration)

### Keybinding Viewer
- On-screen keybinding cheat sheet / help overlay
- Consider [nwg-wrapper](https://github.com/nwg-piotr/nwg-wrapper) for overlay display
- Or a rofi-based keybinding browser (parse bindings.lua → rofi list)
- Keybind: something like SUPER+? or SUPER+F1

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
