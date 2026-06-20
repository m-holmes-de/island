/* Island wlogout — {{THEME_NAME}} */

* {
    font-family: "JetBrains Mono Nerd Font", monospace;
    font-size: 14px;
}

window {
    background-color: alpha({{THEME_BG}}, 0.85);
}

button {
    background-color: alpha({{THEME_BG_HIGHLIGHT}}, 0.6);
    border: 2px solid alpha({{THEME_ACCENT}}, 0.15);
    border-radius: 16px;
    color: {{THEME_FG}};
    margin: 12px;
    padding: 0;
    min-width: 120px;
    min-height: 120px;
    background-repeat: no-repeat;
    background-position: center 28px;
    background-size: 48px;
    padding-top: 72px;
}

button:hover {
    background-color: alpha({{THEME_BG_HIGHLIGHT}}, 0.9);
    border-color: alpha({{THEME_ACCENT}}, 0.4);
    color: {{THEME_ACCENT}};
}

button:focus {
    background-color: alpha({{THEME_BG_HIGHLIGHT}}, 0.9);
    border-color: {{THEME_ACCENT}};
    color: {{THEME_ACCENT}};
}

#lock {
    background-image: image(url("/usr/share/wlogout/icons/lock.png"));
}

#logout {
    background-image: image(url("/usr/share/wlogout/icons/logout.png"));
}

#suspend {
    background-image: image(url("/usr/share/wlogout/icons/suspend.png"));
}

#reboot {
    background-image: image(url("/usr/share/wlogout/icons/reboot.png"));
}

#shutdown {
    background-image: image(url("/usr/share/wlogout/icons/shutdown.png"));
    border-color: alpha({{THEME_ERROR}}, 0.15);
}

#shutdown:hover {
    border-color: alpha({{THEME_ERROR}}, 0.4);
    color: {{THEME_ERROR}};
}

#shutdown:focus {
    border-color: {{THEME_ERROR}};
    color: {{THEME_ERROR}};
}
