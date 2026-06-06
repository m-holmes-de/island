echo "Update ghostty config and add starship prompt config"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Update ghostty config ---
if [[ -f "$HOME/.config/ghostty/config" ]]; then
  if ! grep -q 'background-blur' "$HOME/.config/ghostty/config" 2>/dev/null; then
    echo "  Updating ghostty config"
    cp "$ISLAND_PATH/config/ghostty/config" "$HOME/.config/ghostty/config"
  fi
else
  mkdir -p "$HOME/.config/ghostty"
  cp "$ISLAND_PATH/config/ghostty/config" "$HOME/.config/ghostty/config"
  echo "  Deployed ghostty config"
fi

# --- Deploy starship config ---
if [[ ! -f "$HOME/.config/starship.toml" ]]; then
  echo "  Deploying starship.toml (Rose Pine palette)"
  cp "$ISLAND_PATH/config/starship.toml" "$HOME/.config/starship.toml"
else
  echo "  starship.toml already exists, skipping"
fi

echo "  Done."
