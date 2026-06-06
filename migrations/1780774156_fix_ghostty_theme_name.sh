echo "Fix ghostty theme name: rose-pine -> Rose Pine"

GHOSTTY_CONF="$HOME/.config/ghostty/config"

if [[ ! -f "$GHOSTTY_CONF" ]]; then
  exit 0
fi

if grep -q '^theme = rose-pine$' "$GHOSTTY_CONF" 2>/dev/null; then
  echo "  Fixing theme name to 'Rose Pine'"
  sed -i 's/^theme = rose-pine$/theme = Rose Pine/' "$GHOSTTY_CONF"
fi
