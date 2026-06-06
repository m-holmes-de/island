echo "Add hypr/envs.lua for PATH setup and switch waybar restart to toggle"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"
HYPR_DIR="$HOME/.config/hypr"

# --- Deploy envs.lua if missing ---
if [[ ! -f "$HYPR_DIR/envs.lua" ]]; then
  echo "  Deploying envs.lua"
  cp "$ISLAND_PATH/config/hypr/envs.lua" "$HYPR_DIR/envs.lua"
fi

# --- Add require("hypr.envs") to hyprland.lua if missing ---
if ! grep -q 'hypr.envs' "$HYPR_DIR/hyprland.lua" 2>/dev/null; then
  echo "  Adding require(\"hypr.envs\") to hyprland.lua"
  sed -i '/require("hypr.monitors")/i require("hypr.envs")' "$HYPR_DIR/hyprland.lua"
fi

# --- Switch restart-waybar to toggle-waybar in bindings ---
if grep -q 'island-restart-waybar' "$HYPR_DIR/bindings.lua" 2>/dev/null; then
  echo "  Switching waybar restart to toggle"
  sed -i 's/island-restart-waybar/island-toggle-waybar/g' "$HYPR_DIR/bindings.lua"
  sed -i 's/Restart waybar/Toggle waybar/g' "$HYPR_DIR/bindings.lua"
fi

# --- Clean up broken PATH line from environment.d ---
ENV_FILE="$HOME/.config/environment.d/island-wayland.conf"
if grep -q 'island/bin' "$ENV_FILE" 2>/dev/null; then
  echo "  Removing broken PATH line from environment.d (now handled by envs.lua)"
  sed -i '/island\/bin/d' "$ENV_FILE"
fi

echo "  Done."
