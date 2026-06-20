/* Island Rofi — {{THEME_NAME}} icon grid with blur/xray */

configuration {
    modi: "drun,run,window";
    show-icons: true;
    icon-theme: "Adwaita";
    font: "JetBrains Mono Nerd Font 11";
    display-drun: "";
    display-run: "";
    display-window: "";
    drun-display-format: "{name}";
    hover-select: true;
    me-select-entry: "";
    me-accept-entry: "MousePrimary";
}

* {
    bg: {{THEME_BG}}88;
    bg-entry: {{THEME_BG_HIGHLIGHT}}aa;
    bg-selected: {{THEME_BG_HIGHLIGHT}}dd;
    fg: {{THEME_FG}};
    fg-dim: {{THEME_FG_MUTED}};
    accent: {{THEME_ACCENT}};
    accent-alt: {{THEME_FOAM}};
    urgent: {{THEME_ERROR}};
}

window {
    width: 820px;
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
    padding: 20px;
    spacing: 16px;
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
    placeholder: "Search...";
    placeholder-color: @fg-dim;
    cursor-color: @accent;
}

listview {
    columns: 6;
    lines: 4;
    scrollbar: false;
    background-color: transparent;
    spacing: 8px;
    fixed-height: false;
}

element {
    orientation: vertical;
    padding: 14px 8px;
    background-color: transparent;
    text-color: @fg;
    border-radius: 12px;
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

element normal.urgent,
element alternate.urgent,
element selected.urgent {
    background-color: transparent;
    text-color: @urgent;
}

element normal.active,
element alternate.active,
element selected.active {
    background-color: transparent;
    text-color: @accent-alt;
}

element-icon {
    size: 56px;
    horizontal-align: 0.5;
    background-color: transparent;
    margin: 0 0 8px 0;
}

element-text {
    background-color: transparent;
    text-color: inherit;
    horizontal-align: 0.5;
    font: "JetBrains Mono Nerd Font 9";
}

message {
    background-color: transparent;
}

textbox {
    background-color: transparent;
    text-color: @fg-dim;
}
