echo "Add screen recording support and improve screenshot workflow"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
HYPR_DIR="$HOME/.config/hypr"
WAYBAR_DIR="$HOME/.config/waybar"

# --- Install wf-recorder ---
"$ISLAND_PATH/bin/island-pkg-add" wf-recorder

# --- Update waybar config for recording indicator ---
if [[ -f "$WAYBAR_DIR/config.jsonc" ]]; then
  if ! grep -q 'custom/recording' "$WAYBAR_DIR/config.jsonc" 2>/dev/null; then
    echo "  Updating waybar config with recording indicator"
    cp "$ISLAND_PATH/config/waybar/config.jsonc" "$WAYBAR_DIR/config.jsonc"
  fi
fi

# --- Deploy waybar recording indicator script ---
mkdir -p "$WAYBAR_DIR/scripts"
if [[ ! -f "$WAYBAR_DIR/scripts/recording-indicator.sh" ]]; then
  echo "  Deploying recording indicator script"
  cp "$ISLAND_PATH/config/waybar/scripts/recording-indicator.sh" "$WAYBAR_DIR/scripts/recording-indicator.sh"
  chmod +x "$WAYBAR_DIR/scripts/recording-indicator.sh"
fi

# --- Update waybar style for recording indicator ---
if [[ -f "$WAYBAR_DIR/style.css" ]]; then
  if ! grep -q 'custom-recording' "$WAYBAR_DIR/style.css" 2>/dev/null; then
    echo "  Adding recording indicator style to waybar"
    cp "$ISLAND_PATH/config/waybar/style.css" "$WAYBAR_DIR/style.css"
  fi
fi

# --- Update bindings with screenshot/recording commands ---
if [[ -f "$HYPR_DIR/bindings.lua" ]]; then
  if ! grep -q 'island-capture-recording' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
    echo "  Updating screenshot/recording keybindings"
    sed -i 's|grim -g "\$(slurp -d)" - | satty --filename -|island-capture-screenshot region|' "$HYPR_DIR/bindings.lua" 2>/dev/null || true
    sed -i 's|grim - | satty --filename -|island-capture-screenshot full|' "$HYPR_DIR/bindings.lua" 2>/dev/null || true
    sed -i 's|grim -g "\$(slurp -d)" - | wl-copy|island-capture-screenshot clipboard|' "$HYPR_DIR/bindings.lua" 2>/dev/null || true
    # Add recording bindings if not present
    if ! grep -q 'island-capture-recording' "$HYPR_DIR/bindings.lua"; then
      sed -i '/island-capture-screenshot clipboard/a island.bind("SUPER + SHIFT + Print", "Toggle recording (region)", "island-capture-recording region")\nisland.bind("CTRL + SHIFT + Print", "Toggle recording (full)", "island-capture-recording full")' "$HYPR_DIR/bindings.lua"
    fi
  fi
fi

echo "  Done. Screenshots: Print/Shift+Print. Recording: Super+Shift+Print to toggle."
