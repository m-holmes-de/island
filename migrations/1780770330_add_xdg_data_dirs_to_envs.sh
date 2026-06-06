echo "Add XDG_DATA_DIRS to envs.lua so rofi sees desktop file overrides"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
ENVS="$HOME/.config/hypr/envs.lua"

if [[ ! -f "$ENVS" ]]; then
  echo "  No envs.lua found, skipping."
  exit 0
fi

if grep -q 'XDG_DATA_DIRS' "$ENVS" 2>/dev/null; then
  echo "  XDG_DATA_DIRS already set, skipping."
  exit 0
fi

# Add XDG_DATA_DIRS line before the Wayland section
sed -i '/-- Wayland/i -- XDG (ensure ~/.local/share is included for desktop file overrides)\nhl.env("XDG_DATA_DIRS", home .. "/.local/share:/usr/local/share:/usr/share")\n' "$ENVS"
echo "  Added XDG_DATA_DIRS to envs.lua."
