echo "Add ZSH, Tmux, and Neovim configurations"

ISLAND_PATH="${ISLAND_PATH:-$HOME/.local/share/island}"

# --- Install packages ---
"$ISLAND_PATH/bin/island-pkg-add" zsh starship zoxide neovim tmux lazygit yazi npm

# --- Deploy .zshrc to $HOME ---
if [[ ! -f "$HOME/.zshrc" ]] || ! grep -q 'Island ZSH' "$HOME/.zshrc" 2>/dev/null; then
  if [[ ! -f "$HOME/.zshrc" ]]; then
    echo "  Deploying .zshrc"
    cp "$ISLAND_PATH/default/.zshrc" "$HOME/.zshrc"
  else
    echo "  .zshrc already exists, skipping (backup and replace manually if desired)"
  fi
fi

# --- Deploy tmux config ---
mkdir -p "$HOME/.config/tmux"
if [[ ! -f "$HOME/.config/tmux/tmux.conf" ]]; then
  echo "  Deploying tmux.conf"
  cp "$ISLAND_PATH/config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
fi

# --- Deploy neovim config ---
mkdir -p "$HOME/.config/nvim"
cp -rn "$ISLAND_PATH/config/nvim/"* "$HOME/.config/nvim/" 2>/dev/null || true
echo "  Neovim config deployed (existing files preserved)"

# --- Install TPM (Tmux Plugin Manager) ---
TPM_DIR="$HOME/.config/tmux/plugins/tpm"
if [[ ! -d "$TPM_DIR" ]]; then
  echo "  Installing TPM"
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
  "$TPM_DIR/bin/install_plugins" || echo "  TPM plugins will install on first tmux launch"
fi

# --- Shell change notice ---
if [[ "$SHELL" != */zsh ]]; then
  echo ""
  echo "  To switch your default shell to zsh, run:"
  echo "    chsh -s \$(which zsh)"
fi

echo "  Done."
