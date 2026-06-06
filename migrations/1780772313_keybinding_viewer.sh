echo "Add keybinding viewer (SUPER+/)"

HYPR_DIR="$HOME/.config/hypr"

if [[ ! -f "$HYPR_DIR/bindings.lua" ]]; then
  echo "  No bindings.lua found, skipping."
  exit 0
fi

if grep -q 'island-keybindings' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  echo "  Keybinding viewer already configured, skipping."
  exit 0
fi

sed -i '/island-wallpaper-select/a island.bind("SUPER + SLASH", "Keybindings", "island-keybindings")' "$HYPR_DIR/bindings.lua"
echo "  Added SUPER+/ to show keybindings."
