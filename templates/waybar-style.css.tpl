/* Island Waybar — {{THEME_NAME}} */

* {
    font-family: "JetBrains Mono Nerd Font", monospace;
    font-size: 13px;
    min-height: 0;
    border: none;
}

window#waybar {
    background: alpha({{THEME_BG_ALT}}, 0.88);
    color: {{THEME_FG_DIM}};
    border-radius: 10px;
}

.modules-left {
    margin-left: 8px;
}

.modules-right {
    margin-right: 8px;
}

/* --- Workspaces --- */

#workspaces button {
    all: initial;
    font-family: "JetBrains Mono Nerd Font", monospace;
    font-size: 12px;
    padding: 0 6px;
    margin: 0 1px;
    color: {{THEME_FG_MUTED}};
    min-width: 10px;
}

#workspaces button.active {
    color: {{THEME_FG}};
}

#workspaces button.empty {
    opacity: 0.4;
}

#workspaces button:hover {
    color: {{THEME_FG}};
}

/* --- Window title --- */

#window {
    padding: 0 12px;
    margin: 4px 1px;
    color: {{THEME_FG_MUTED}};
    font-size: 11px;
}

/* --- Modules --- */

#clock,
#pulseaudio,
#network,
#bluetooth,
#tray,
#custom-recording {
    padding: 0 8px;
    margin: 4px 1px;
}

#clock {
    color: {{THEME_FG_DIM}};
}

/* --- System monitors (bordered group) --- */

#cpu,
#memory,
#disk,
#custom-uptime,
#battery {
    padding: 0 8px;
    margin: 4px 0;
    font-size: 11px;
    color: {{THEME_FG_DIM}};
}

#cpu {
    border: 1px solid {{THEME_BG_HIGHLIGHT}};
    border-radius: 8px 0 0 8px;
    border-right: none;
    margin-left: 4px;
    padding-left: 10px;
}

#memory {
    border-top: 1px solid {{THEME_BG_HIGHLIGHT}};
    border-bottom: 1px solid {{THEME_BG_HIGHLIGHT}};
}

#disk {
    border-top: 1px solid {{THEME_BG_HIGHLIGHT}};
    border-bottom: 1px solid {{THEME_BG_HIGHLIGHT}};
}

#custom-uptime {
    border-top: 1px solid {{THEME_BG_HIGHLIGHT}};
    border-bottom: 1px solid {{THEME_BG_HIGHLIGHT}};
}

#battery {
    border: 1px solid {{THEME_BG_HIGHLIGHT}};
    border-radius: 0 8px 8px 0;
    border-left: none;
    margin-right: 4px;
    padding-right: 10px;
}

#cpu.high,
#memory.high {
    color: {{THEME_WARN}};
}

#cpu.critical,
#memory.critical,
#disk.critical {
    color: {{THEME_ERROR}};
}

#disk.high {
    color: {{THEME_WARN}};
}

#battery.warning {
    color: {{THEME_WARN}};
}

#battery.critical {
    color: {{THEME_ERROR}};
}

/* --- Tray (desaturate app icons) --- */

#tray {
    opacity: 0.6;
}

#tray > .passive {
    opacity: 0.4;
}

/* --- Recording indicator --- */

#custom-recording.active {
    color: {{THEME_ERROR}};
}

/* --- Tooltip --- */

tooltip {
    background: {{THEME_BG}};
    color: {{THEME_FG}};
    border: 1px solid {{THEME_BG_HIGHLIGHT}};
    border-radius: 8px;
}
