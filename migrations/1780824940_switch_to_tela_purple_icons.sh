echo "Switch icons to Tela Circle Purple for more pop with Rose Pine"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Install purple icon theme ---
"$ISLAND_PATH/bin/island-pkg-add" tela-circle-icon-theme-purple

# --- Update settings ---
cp "$ISLAND_PATH/config/gtk-3.0/settings.ini" "$HOME/.config/gtk-3.0/settings.ini"
mkdir -p "$HOME/.config/gtk-4.0"
cp "$ISLAND_PATH/config/gtk-3.0/settings.ini" "$HOME/.config/gtk-4.0/settings.ini"

if command -v xfconf-query &>/dev/null; then
  xfconf-query -c xsettings -p /Net/IconThemeName -s "Tela-circle-purple-dark" --create -t string 2>/dev/null
fi

if command -v gsettings &>/dev/null; then
  gsettings set org.gnome.desktop.interface icon-theme 'Tela-circle-purple-dark' 2>/dev/null || true
fi

echo "  Done."
