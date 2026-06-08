# {{THEME_NAME}} lock screen

background {
    monitor =
    blur_passes = 3
    blur_size = 8
    noise = 0.01
    contrast = 0.9
    brightness = 0.8
}

input-field {
    monitor =
    size = 300, 50
    outline_thickness = 3
    dots_size = 0.25
    dots_spacing = 0.2
    dots_center = true
    outer_color = rgb({{THEME_ACCENT_STRIP}})
    inner_color = rgb({{THEME_BG_STRIP}})
    font_color = rgb({{THEME_FG_STRIP}})
    fade_on_empty = true
    placeholder_text = <span foreground="##{{THEME_FG_DIM_STRIP}}">Password...</span>
    hide_input = false
    rounding = 8
    position = 0, -20
    halign = center
    valign = center
}

label {
    monitor =
    text = $TIME
    color = rgb({{THEME_FG_STRIP}})
    font_size = 64
    font_family = JetBrains Mono Nerd Font
    position = 0, 80
    halign = center
    valign = center
}

label {
    monitor =
    text = cmd[update:3600000] date +"%A, %B %d"
    color = rgb({{THEME_FG_DIM_STRIP}})
    font_size = 20
    font_family = JetBrains Mono Nerd Font
    position = 0, 160
    halign = center
    valign = center
}
