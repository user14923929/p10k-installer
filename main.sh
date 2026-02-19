#!/data/data/com.termux/files/usr/bin/bash

set -e

clear

line() {
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

title() {
  line
  echo "p10k-installer • Termux Branch"
  line
  echo
}

error() {
  echo "✖ $1"
  exit 1
}

step() {
  echo
  echo "➤ $1"
}

# ─────────────────────────────

title

# Detect Termux
if [ -z "$PREFIX" ] || [[ "$PREFIX" != *com.termux* ]]; then
  error "This branch is made for Termux only."
fi

echo "✔ Termux detected"

# Update packages
step "Updating packages"
pkg update -y
pkg upgrade -y

# Install dependencies
step "Installing dependencies"
pkg install -y zsh git curl wget

# Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  step "Installing Oh My Zsh"
  RUNZSH=no CHSH=no KEEP_ZSHRC=yes \
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "✔ Oh My Zsh already installed"
fi

# Install Powerlevel10k
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  step "Installing Powerlevel10k"
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
else
  echo "✔ Powerlevel10k already installed"
fi

# Set theme
step "Setting Powerlevel10k theme"

if grep -q '^ZSH_THEME=' "$HOME/.zshrc"; then
  sed -i 's|^ZSH_THEME=.*|ZSH_THEME="powerlevel10k/powerlevel10k"|' "$HOME/.zshrc"
else
  echo 'ZSH_THEME="powerlevel10k/powerlevel10k"' >> "$HOME/.zshrc"
fi

# Make zsh default
if ! grep -q "exec zsh" "$HOME/.bashrc"; then
  step "Setting Zsh as default shell"
  echo "exec zsh" >> "$HOME/.bashrc"
fi

# Terminal size safeguard
if ! grep -q "stty rows" "$HOME/.zshrc"; then
  echo "stty rows 24 cols 80" >> "$HOME/.zshrc"
fi

line
echo "✔ Installation complete"
line
echo
echo "Restart Termux."
echo "Enable Nerd Font in settings."
echo

sleep 1

exec zsh -i -c "p10k configure"
