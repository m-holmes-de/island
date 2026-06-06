echo "Fix starship icons and ghostty font size"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Starship: replace with config that has proper Nerd Font icons ---
echo "  Updating starship.toml (restoring icons, Rose Pine palette)"
cp "$ISLAND_PATH/config/starship.toml" "$HOME/.config/starship.toml"

# --- Ghostty: fix font size ---
if grep -q 'font-size = 13' "$HOME/.config/ghostty/config" 2>/dev/null; then
  echo "  Fixing ghostty font size to 12"
  sed -i 's/font-size = 13/font-size = 12/' "$HOME/.config/ghostty/config"
fi
