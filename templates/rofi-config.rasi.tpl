/* Island Rofi — {{THEME_NAME}} */

configuration {
    modi: "drun,run,window";
    show-icons: true;
    icon-theme: "Adwaita";
    font: "JetBrains Mono Nerd Font 12";
    display-drun: "Apps";
    display-run: "Run";
    display-window: "Windows";
    drun-display-format: "{name}";
}

* {
    bg: {{THEME_BG}}dd;
    bg-alt: {{THEME_BG_HIGHLIGHT}};
    fg: {{THEME_FG}};
    accent: {{THEME_ACCENT}};
    urgent: {{THEME_ERROR}};
    border-radius: 8px;
}

window {
    width: 600px;
    background-color: @bg;
    border: 2px solid;
    border-color: @accent;
    border-radius: 12px;
    padding: 20px;
}

inputbar {
    children: [prompt, textbox-prompt-colon, entry];
    background-color: @bg-alt;
    border-radius: 8px;
    padding: 8px 12px;
    margin: 0 0 12px 0;
}

prompt {
    background-color: transparent;
    text-color: @accent;
}

textbox-prompt-colon {
    expand: false;
    str: " > ";
    text-color: @accent;
    background-color: transparent;
}

entry {
    background-color: transparent;
    text-color: @fg;
    placeholder: "Search...";
    placeholder-color: {{THEME_FG_MUTED}};
}

listview {
    columns: 1;
    lines: 8;
    scrollbar: false;
    background-color: transparent;
    spacing: 4px;
}

element {
    padding: 8px 12px;
    background-color: transparent;
    text-color: @fg;
    border-radius: 6px;
}

element selected {
    background-color: @bg-alt;
    text-color: @accent;
}

element-icon {
    size: 24px;
    margin: 0 8px 0 0;
    background-color: transparent;
}

element-text {
    background-color: transparent;
    text-color: inherit;
}
