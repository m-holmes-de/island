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

/* --- Modules --- */

#clock,
#pulseaudio,
#network,
#bluetooth,
#battery,
#tray,
#custom-recording {
    padding: 0 8px;
    margin: 4px 1px;
}

#clock {
    color: {{THEME_FG}};
}

#battery.warning {
    color: {{THEME_WARN}};
}

#battery.critical {
    color: {{THEME_ERROR}};
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
