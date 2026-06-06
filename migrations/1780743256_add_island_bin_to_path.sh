echo "Add island bin/ to PATH via environment.d"

ENV_FILE="$HOME/.config/environment.d/island-wayland.conf"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "  No environment.d config found, skipping."
  exit 0
fi

if grep -q 'island/bin' "$ENV_FILE" 2>/dev/null; then
  echo "  island/bin already in PATH, skipping."
  exit 0
fi

# Prepend ISLAND_PATH and PATH lines
sed -i "1i ISLAND_PATH=$HOME/.local/share/island\nPATH=$HOME/.local/share/island/bin:\$PATH" "$ENV_FILE"
echo "  Added ISLAND_PATH and island/bin to PATH."
