echo "Fix GTK theme: use rose-pine-moon-gtk (dark) and set color-scheme to prefer-dark"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Fix GTK3 settings ---
GTK3="$HOME/.config/gtk-3.0/settings.ini"
if [[ -f "$GTK3" ]] && grep -q 'gtk-theme-name=rose-pine-gtk$' "$GTK3" 2>/dev/null; then
  echo "  Switching GTK theme to rose-pine-moon-gtk (dark)"
  sed -i 's/gtk-theme-name=rose-pine-gtk$/gtk-theme-name=rose-pine-moon-gtk/' "$GTK3"
fi

# --- Fix GTK4 settings ---
GTK4="$HOME/.config/gtk-4.0/settings.ini"
if [[ -f "$GTK4" ]] && grep -q 'gtk-theme-name=rose-pine-gtk$' "$GTK4" 2>/dev/null; then
  sed -i 's/gtk-theme-name=rose-pine-gtk$/gtk-theme-name=rose-pine-moon-gtk/' "$GTK4"
fi

# --- Set gsettings for dark mode ---
if command -v gsettings &>/dev/null; then
  gsettings set org.gnome.desktop.interface gtk-theme 'rose-pine-moon-gtk' 2>/dev/null || true
  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark' 2>/dev/null || true
fi

echo "  Done. Reopen Thunar to see the dark theme."
