echo "Add wallpaper selector with rofi, switch from hyprpaper to swaybg"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
HYPR_DIR="$HOME/.config/hypr"

# --- Install swaybg ---
"$ISLAND_PATH/bin/island-pkg-add" swaybg

# --- Update autostart: replace hyprpaper with island-wallpaper-restore ---
if [[ -f "$HYPR_DIR/autostart.lua" ]]; then
  if grep -q 'hyprpaper' "$HYPR_DIR/autostart.lua" 2>/dev/null; then
    echo "  Switching autostart from hyprpaper to swaybg wallpaper restore"
    sed -i 's|island.exec_on_start("hyprpaper")|-- Wallpaper (swaybg) — restore last wallpaper or use default\nisland.exec_on_start("island-wallpaper-restore")|' "$HYPR_DIR/autostart.lua"
  fi
fi

# --- Add wallpaper keybinding ---
if [[ -f "$HYPR_DIR/bindings.lua" ]]; then
  if ! grep -q 'island-wallpaper-select' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
    echo "  Adding SUPER+W wallpaper selector keybinding"
    sed -i '/=== TUI Launchers ===/i island.bind("SUPER + W", "Wallpaper selector", "island-wallpaper-select")\n' "$HYPR_DIR/bindings.lua"
  fi
fi

echo "  Done. Use SUPER+W to select wallpapers from ~/wallpapers/"
