# Island

A Hyprland desktop environment for CachyOS. Minimal, TUI-first, Rose Pine themed.

Inspired by [Omarchy](https://github.com/basecamp/omarchy).

## Install

```bash
git clone https://github.com/area9/island.git
cd island
./install.sh
```

Then log out, select **Hyprland** from the session picker, and log in.

## What you get

- **Hyprland** window manager with sensible defaults
- **Waybar** status bar with workspaces, clock, battery, audio, network, bluetooth
- **Rofi** app launcher (SUPER+Space)
- **Ghostty** terminal (SUPER+Return)
- **Mako** notifications
- **Hyprlock** + **Hypridle** for lock screen and idle management
- **Screenshots** via grim + slurp + satty
- **Clipboard history** via cliphist
- TUI tools: **impala** (wifi), **bluetui** (bluetooth), **pulsemixer** (audio), **btop** (system)

## Keybindings

See [docs/keybindings.md](docs/keybindings.md) for the full reference.

Quick start:
- `SUPER+Return` — Terminal
- `SUPER+Space` — App launcher
- `SUPER+B` — Browser
- `SUPER+Q` — Close window
- `SUPER+1-0` — Workspaces

## Architecture

See [docs/architecture.md](docs/architecture.md).

Migration-based, idempotent install system. Safe to re-run `./install.sh` at any time.

## License

MIT
