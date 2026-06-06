# Deploy config files to ~/.config (no-clobber)
echo "Deploying configuration files..."
mkdir -p ~/.config

for dir in "$ISLAND_PATH"/config/*/; do
  [[ -d "$dir" ]] || continue
  dirname=$(basename "$dir")
  mkdir -p ~/.config/"$dirname"
  # cp -rn: recursive, no-clobber (never overwrite existing)
  cp -rn "$dir"* ~/.config/"$dirname"/ 2>/dev/null || true
done

# Copy standalone config files
for file in "$ISLAND_PATH"/config/*; do
  [[ -f "$file" ]] || continue
  cp -n "$file" ~/.config/ 2>/dev/null || true
done

echo "Configs deployed to ~/.config/"

# Deploy home-directory dotfiles (.zshrc, etc.)
for file in "$ISLAND_PATH"/default/.*; do
  [[ -f "$file" ]] || continue
  cp -n "$file" ~/ 2>/dev/null || true
done
echo "Home dotfiles deployed."
