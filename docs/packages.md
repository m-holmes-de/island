# Island Packages & Tools

## Core Desktop

| Package | Purpose | Docs |
|---------|---------|------|
| [Hyprland](https://wiki.hyprland.org/) | Wayland tiling compositor | [Wiki](https://wiki.hyprland.org/), [Lua API](https://wiki.hyprland.org/Configuring/Lua-API/) |
| [Waybar](https://github.com/Alexays/Waybar) | Status bar | [Wiki](https://github.com/Alexays/Waybar/wiki) |
| [Rofi](https://github.com/lbonn/rofi) | App launcher (Wayland fork) | [Docs](https://davatorium.github.io/rofi/) |
| [Mako](https://github.com/emersion/mako) | Notification daemon | [Man page](https://github.com/emersion/mako/blob/master/doc/mako.5.scd) |
| [Hyprlock](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/) | Lock screen | [Wiki](https://wiki.hyprland.org/Hypr-Ecosystem/hyprlock/) |
| [Hypridle](https://wiki.hyprland.org/Hypr-Ecosystem/hypridle/) | Idle manager | [Wiki](https://wiki.hyprland.org/Hypr-Ecosystem/hypridle/) |
| [swaybg](https://github.com/swaywm/swaybg) | Wallpaper | [Man page](https://github.com/swaywm/swaybg/blob/master/swaybg.1.scd) |
| [UWSM](https://github.com/Vladimir-csp/uwsm) | Session manager | [README](https://github.com/Vladimir-csp/uwsm) |

## Terminal & Applications

| Package | Purpose | Docs |
|---------|---------|------|
| [Ghostty](https://ghostty.org/) | Terminal emulator | [Docs](https://ghostty.org/docs) |
| [Firefox](https://www.mozilla.org/firefox/) | Browser | |
| [Thunar](https://docs.xfce.org/xfce/thunar/start) | File manager | [Docs](https://docs.xfce.org/xfce/thunar/start) |

## TUI Tools

These are launched via keybindings in a Ghostty window — no GUI tray applets.

| Package | Purpose | Keybinding | Docs |
|---------|---------|------------|------|
| [impala](https://github.com/pythops/impala) | WiFi management | SUPER+N | [README](https://github.com/pythops/impala) |
| [bluetui](https://github.com/pythops/bluetui) | Bluetooth management | SUPER+O | [README](https://github.com/pythops/bluetui) |
| [pulsemixer](https://github.com/GeorgeFilipworkin/pulsemixer) | Audio mixer | SUPER+A | [README](https://github.com/GeorgeFilipworkin/pulsemixer) |
| [btop](https://github.com/aristocratos/btop) | System monitor | SUPER+M | [README](https://github.com/aristocratos/btop) |

## Screenshots & Clipboard

| Package | Purpose | Docs |
|---------|---------|------|
| [grim](https://sr.ht/~emersion/grim/) | Screenshot capture | [Man page](https://sr.ht/~emersion/grim/) |
| [slurp](https://github.com/emersion/slurp) | Region selection | [Man page](https://github.com/emersion/slurp) |
| [satty](https://github.com/gabm/satty) | Screenshot annotation | [README](https://github.com/gabm/satty) |
| [wl-clipboard](https://github.com/bugaevc/wl-clipboard) | Clipboard (wl-copy/wl-paste) | [README](https://github.com/bugaevc/wl-clipboard) |
| [cliphist](https://github.com/sentriz/cliphist) | Clipboard history | [README](https://github.com/sentriz/cliphist) |

## Audio & Media

| Package | Purpose | Docs |
|---------|---------|------|
| [PipeWire](https://pipewire.org/) | Audio server | [Wiki](https://gitlab.freedesktop.org/pipewire/pipewire/-/wikis/home) |
| [WirePlumber](https://pipewire.pages.freedesktop.org/wireplumber/) | PipeWire session manager | [Docs](https://pipewire.pages.freedesktop.org/wireplumber/) |
| [playerctl](https://github.com/altdesktop/playerctl) | Media player control | [README](https://github.com/altdesktop/playerctl) |
| [pamixer](https://github.com/cdemoulins/pamixer) | Volume CLI | [README](https://github.com/cdemoulins/pamixer) |
| [brightnessctl](https://github.com/Hummer12007/brightnessctl) | Brightness control | [README](https://github.com/Hummer12007/brightnessctl) |

## Hiding Apps from Launcher

Unwanted apps (Cosmic desktop, Avahi, system internals) are hidden from rofi
by placing `.desktop` files with `Hidden=true` in `~/.local/share/applications/`.
Source files are in `applications/hidden/` in the repo.

To hide a new app, add a file `applications/hidden/<app-name>.desktop`:
```
[Desktop Entry]
Hidden=true
```
Then create a migration to deploy it.
