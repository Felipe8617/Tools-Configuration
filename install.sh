#!/usr/bin/env bash
# Instala y enlaza (symlink) las configs de zsh, oh-my-zsh, fzf y yazi en macOS.
set -euo pipefail
REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

backup_link() { # origen destino
  mkdir -p "$(dirname "$2")"
  if [ -e "$2" ] && [ ! -L "$2" ]; then mv "$2" "$2.bak.$(date +%s)"; fi
  ln -sfn "$1" "$2"; echo "link: $2 -> $1"
}

# 1. Homebrew + paquetes
command -v brew >/dev/null || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew bundle --file="$REPO/Brewfile"

# 2. oh-my-zsh y plugins
[ -d "$HOME/.oh-my-zsh" ] || RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
for p in zsh-autosuggestions zsh-completions; do
  [ -d "$ZSH_CUSTOM/plugins/$p" ] || git clone "https://github.com/zsh-users/$p" "$ZSH_CUSTOM/plugins/$p"
done

# 3. Enlaces
backup_link "$REPO/zsh/zshrc"    "$HOME/.zshrc"
backup_link "$REPO/zsh/zprofile" "$HOME/.zprofile"
backup_link "$REPO/yazi"         "$HOME/.config/yazi"

echo "Listo. Abre una nueva terminal (o: source ~/.zshrc)."
