echo "Fix Thunar dark mode: set GTK ApplicationPreferDarkTheme via xfconf"

if command -v xfconf-query &>/dev/null; then
  xfconf-query -c xsettings -p /Gtk/ApplicationPreferDarkTheme -s true --create -t bool 2>/dev/null
  echo "  Dark theme preference set."
fi
