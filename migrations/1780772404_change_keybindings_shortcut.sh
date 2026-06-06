echo "Change keybinding viewer shortcut to SUPER+SHIFT+K"

BINDINGS="$HOME/.config/hypr/bindings.lua"

if [[ ! -f "$BINDINGS" ]]; then
  exit 0
fi

if grep -q 'SUPER + SHIFT + K.*island-keybindings' "$BINDINGS" 2>/dev/null; then
  echo "  Already set, skipping."
  exit 0
fi

sed -i 's/SUPER + SLASH.*island-keybindings/SUPER + SHIFT + K", "Keybindings", "island-keybindings/' "$BINDINGS"
echo "  Changed to SUPER+SHIFT+K."
