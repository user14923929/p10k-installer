#!/usr/bin/env bash

set -e

tfu() {
  echo "Thanks for using :)"
}

echo "🔐 Checking root privileges..."
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root."
  echo "Use: sudo ./main.sh"
  tfu
  exit 1
fi

# Detect real user (the one who used sudo)
TARGET_USER=${SUDO_USER:-$(logname)}
USER_HOME=$(eval echo "~$TARGET_USER")

echo "👤 Target user: $TARGET_USER"
echo "🏠 Home directory: $USER_HOME"

echo "📦 Updating packages..."
apt update

echo "⚙ Installing zsh, git, curl..."
apt install -y zsh git curl

echo "📦 Package versions:"
zsh --version
git --version
curl --version

echo "🐚 Installing Oh My Zsh..."
if [ ! -d "$USER_HOME/.oh-my-zsh" ]; then
  sudo -u "$TARGET_USER" RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "🎨 Installing Powerlevel10k..."
ZSH_CUSTOM="$USER_HOME/.oh-my-zsh/custom"

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  sudo -u "$TARGET_USER" git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    "$ZSH_CUSTOM/themes/powerlevel10k"
fi

echo "🛠 Setting Powerlevel10k theme..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' \
  "$USER_HOME/.zshrc"

echo "🔄 Changing default shell to zsh..."
chsh -s "$(which zsh)" "$TARGET_USER"

echo ""
echo "✅ Installation complete!"
echo "User '$TARGET_USER' can now run:"
echo "  exec zsh"
echo "Or log in again with the same username, '$TARGET_USER'"
echo ""
echo "Run p10k setup? (y: yes):"

read OPTION
if [ "$OPTION" = "y" ]
then
  source ~/.p10k.zsh 2>/dev/null || true
  exec zsh -i -c 'p10k configure'
else
  exit 0
fi

tfu