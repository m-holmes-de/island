/* Island Rofi dmenu — {{THEME_NAME}} list style for text menus */

configuration {
    show-icons: false;
}

* {
    bg: {{THEME_BG}}88;
    bg-entry: {{THEME_BG_HIGHLIGHT}}aa;
    bg-selected: {{THEME_BG_HIGHLIGHT}}dd;
    fg: {{THEME_FG}};
    fg-dim: {{THEME_FG_MUTED}};
    accent: {{THEME_ACCENT}};
    urgent: {{THEME_ERROR}};
}

window {
    width: 700px;
    background-color: @bg;
    border: 1px solid;
    border-color: {{THEME_ACCENT}}33;
    border-radius: 16px;
    padding: 0;
    location: north;
    anchor: north;
    y-offset: 46px;
}

mainbox {
    background-color: transparent;
    padding: 16px;
    spacing: 12px;
}

inputbar {
    children: [textbox-prompt-icon, entry];
    background-color: @bg-entry;
    border: 1px solid;
    border-color: {{THEME_ACCENT}}22;
    border-radius: 12px;
    padding: 12px 16px;
}

textbox-prompt-icon {
    expand: false;
    str: " ";
    text-color: @accent;
    background-color: transparent;
    padding: 0 8px 0 0;
}

entry {
    background-color: transparent;
    text-color: @fg;
    placeholder: "Filter...";
    placeholder-color: @fg-dim;
    cursor-color: @accent;
}

listview {
    columns: 1;
    lines: 20;
    scrollbar: false;
    background-color: transparent;
    spacing: 2px;
    fixed-height: false;
}

element {
    padding: 6px 14px;
    background-color: transparent;
    text-color: @fg;
    border-radius: 8px;
}

element normal.normal,
element alternate.normal {
    background-color: transparent;
    text-color: @fg;
}

element selected.normal {
    background-color: @bg-selected;
    text-color: @accent;
}

element-icon {
    background-color: transparent;
    size: 24px;
    margin: 0 8px 0 0;
}

element-text {
    background-color: transparent;
    text-color: inherit;
    font: "JetBrains Mono Nerd Font 11";
}

message {
    background-color: transparent;
}

textbox {
    background-color: transparent;
    text-color: @fg-dim;
}
