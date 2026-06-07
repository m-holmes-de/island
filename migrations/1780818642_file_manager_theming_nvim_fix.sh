echo "File manager theming (yazi Rose Pine, GTK dark), fix nvim symlink, add yazi keybind"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Fix nvim symlink (was still pointing to stow source) ---
if [[ -L "$HOME/.config/nvim" ]]; then
  echo "  Fixing nvim: removing stow symlink, deploying Island copy"
  rm "$HOME/.config/nvim"
  mkdir -p "$HOME/.config/nvim"
  cp -r "$ISLAND_PATH/config/nvim/"* "$HOME/.config/nvim/"
fi

# --- Deploy yazi Rose Pine theme ---
mkdir -p "$HOME/.config/yazi/themes"
if [[ ! -f "$HOME/.config/yazi/theme.toml" ]] || ! grep -q 'Rose Pine' "$HOME/.config/yazi/theme.toml" 2>/dev/null; then
  echo "  Deploying yazi Rose Pine theme"
  cp "$ISLAND_PATH/config/yazi/theme.toml" "$HOME/.config/yazi/theme.toml"
  cp -rn "$ISLAND_PATH/config/yazi/themes/"* "$HOME/.config/yazi/themes/" 2>/dev/null || true
fi

# --- Deploy GTK dark theme for Thunar ---
mkdir -p "$HOME/.config/gtk-3.0"
if [[ ! -f "$HOME/.config/gtk-3.0/settings.ini" ]]; then
  echo "  Deploying GTK dark theme (adw-gtk3-dark)"
  cp "$ISLAND_PATH/config/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"
fi

# --- Add yazi keybinding ---
BINDINGS="$HOME/.config/hypr/bindings.lua"
if [[ -f "$BINDINGS" ]] && ! grep -q 'SUPER + Y' "$BINDINGS" 2>/dev/null; then
  echo "  Adding SUPER+Y for yazi"
  sed -i '/File manager.*thunar/a island.bind("SUPER + Y", "File manager (yazi)", island.tui("yazi"))' "$BINDINGS"
fi

echo "  Done."
