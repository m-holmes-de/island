# Island Keybindings

All bindings use SUPER (Windows/Meta) as the primary modifier.

## Applications

| Key | Action |
|-----|--------|
| SUPER + Return | Terminal (ghostty) |
| SUPER + Space | App launcher (rofi) |
| SUPER + B | Browser (firefox) |
| SUPER + E | File manager (thunar) |
| SUPER + V | Clipboard history |

## TUI Tools

| Key | Action |
|-----|--------|
| SUPER + N | Network manager (impala) |
| SUPER + O | Bluetooth (bluetui) |
| SUPER + A | Audio mixer (pulsemixer) |
| SUPER + M | System monitor (btop) |

## Window Management

| Key | Action |
|-----|--------|
| SUPER + Q | Close window |
| SUPER + F | Fullscreen |
| SUPER + SHIFT + F | Maximized |
| SUPER + T | Toggle floating |
| SUPER + P | Pseudo tile |
| SUPER + J | Toggle split direction |

## Focus (vim-style + arrows)

| Key | Action |
|-----|--------|
| SUPER + H / Left | Focus left |
| SUPER + L / Right | Focus right |
| SUPER + K / Up | Focus up |
| SUPER + Down | Focus down |
| ALT + TAB | Cycle windows |

## Move Windows

| Key | Action |
|-----|--------|
| SUPER + SHIFT + H/J/K/L | Swap window in direction |
| SUPER + SHIFT + Arrows | Swap window in direction |

## Resize Windows

| Key | Action |
|-----|--------|
| SUPER + - | Shrink window |
| SUPER + = | Grow window |
| SUPER + CTRL + H | Shrink width |
| SUPER + CTRL + L | Grow width |
| SUPER + CTRL + K | Shrink height |
| SUPER + CTRL + J | Grow height |

## Workspaces

| Key | Action |
|-----|--------|
| SUPER + 1-0 | Switch to workspace 1-10 |
| SUPER + SHIFT + 1-0 | Move window to workspace |
| SUPER + TAB | Next workspace |
| SUPER + SHIFT + TAB | Previous workspace |
| SUPER + S | Toggle scratchpad |
| SUPER + SHIFT + S | Move to scratchpad |

## Mouse

| Key | Action |
|-----|--------|
| SUPER + Left click drag | Move window |
| SUPER + Right click drag | Resize window |
| SUPER + Scroll | Cycle workspaces |

## Screenshots & Recording

| Key | Action |
|-----|--------|
| Print | Screenshot region (save + clipboard + satty editor) |
| SHIFT + Print | Screenshot fullscreen (save + clipboard + satty editor) |
| SUPER + Print | Screenshot region to clipboard only |
| SUPER + SHIFT + Print | Toggle screen recording (region select) |
| CTRL + SHIFT + Print | Toggle screen recording (fullscreen) |

Screenshots saved to `~/Pictures/Screenshots/`. Recordings saved to `~/Videos/Recordings/`.
A red 󰻂 icon appears in waybar while recording.

## Media

| Key | Action |
|-----|--------|
| Volume Up/Down | Adjust volume |
| Mute | Toggle mute |
| Brightness Up/Down | Adjust brightness |
| Play/Pause | Media play/pause |
| Next/Prev | Media next/previous |

## System

| Key | Action |
|-----|--------|
| SUPER + SHIFT + / | Show keybinding viewer |
| SUPER + Escape | Lock screen |
| SUPER + SHIFT + Q | Exit Hyprland |

## Known Issues

- **HYPER + SHIFT + 2 does not move window to workspace 2** when using kanata
  (CapsLock as Hyper). All other HYPER + SHIFT + number combos work. Pressing
  the physical keys (Super+Ctrl+Alt+Shift+2) works correctly. Suspected
  interaction between kanata's virtual modifier output, German keyboard layout
  (`de`), and the `code:11` keycode. TODO: reproduce after reboot and debug
  with `wev` to compare key events for HYPER+SHIFT+1 vs HYPER+SHIFT+2.
