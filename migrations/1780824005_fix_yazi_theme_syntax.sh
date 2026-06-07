echo "Fix yazi theme: name -> url for newer yazi versions"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
THEME="$HOME/.config/yazi/theme.toml"

if [[ -f "$THEME" ]] && grep -q '{ name = ' "$THEME" 2>/dev/null; then
  echo "  Updating yazi theme (name -> url)"
  cp "$ISLAND_PATH/config/yazi/theme.toml" "$THEME"
fi
