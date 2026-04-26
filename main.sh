#!/usr/bin/env bash

set -e

tfu() {
  echo "Thanks for using :)"
}

echo "🔐 Checking root privileges..."
if [ "$EUID" -ne 0 ]; then
  echo "This script must be run as root."
  echo "curl -fsSL https://raw.githubusercontent.com/user14923929/p10k-installer/refs/heads/master/main.sh | sudo bash"
  tfu
  exit 1
fi

# Detect real user (the one who used sudo)
TARGET_USER=${SUDO_USER:-$(logname)}
USER_HOME=$(eval echo "~$TARGET_USER")

echo "👤 Target user: $TARGET_USER"
echo "🏠 Home directory: $USER_HOME"

# --------- Backup .zshrc ---------
if [ -f "$USER_HOME/.zshrc" ]; then
  cp "$USER_HOME/.zshrc" "$USER_HOME/.zshrc.backup_$(date +%s)"
  echo "💾 Backup of .zshrc created."
fi

# --------- Detect package manager ---------
echo "📦 Detecting package manager..."
if command -v apt >/dev/null; then
  PKG_INSTALL="apt install -y"
  PKG_UPDATE="apt update"
elif command -v pacman >/dev/null; then
  PKG_INSTALL="pacman -S --noconfirm"
  PKG_UPDATE="pacman -Syu --noconfirm"
elif command -v dnf >/dev/null; then
  PKG_INSTALL="dnf install -y"
  PKG_UPDATE="dnf check-update || true"
else
  echo "❌ Unsupported package manager. Install zsh, git, curl manually."
  tfu
  exit 1
fi

echo "📦 Updating packages..."
$PKG_UPDATE

echo "⚙ Installing dependencies: zsh, git, curl..."
$PKG_INSTALL zsh git curl

echo "📦 Package versions:"
zsh --version
git --version
curl --version

# --------- Oh My Zsh ---------
echo "🐚 Installing Oh My Zsh..."
if [ ! -d "$USER_HOME/.oh-my-zsh" ]; then
  sudo -u "$TARGET_USER" RUNZSH=no CHSH=no sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# --------- Powerlevel10k ---------
echo "🎨 Installing Powerlevel10k..."
ZSH_CUSTOM="$USER_HOME/.oh-my-zsh/custom"

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  sudo -u "$TARGET_USER" git clone --depth=1 \
    https://github.com/romkatv/powerlevel10k.git \
    "$ZSH_CUSTOM/themes/powerlevel10k"
fi

echo "🛠 Setting Powerlevel10k theme..."
sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' "$USER_HOME/.zshrc"

# --------- MesloLGS NF fonts ---------
echo "🔤 Installing MesloLGS Nerd Fonts... [SKIP]"
# FONT_DIR="$USER_HOME/.local/share/fonts"
# mkdir -p "$FONT_DIR"
# for style in Regular Bold Italic Bold\ Italic; do
#   sudo -u "$TARGET_USER" curl -fLo "$FONT_DIR/MesloLGS NF $style.ttf" \
#     "https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20$style.ttf"
# done
# fc-cache -fv >/dev/null 2>&1

# --------- Set default shell ---------
echo "🔄 Changing default shell to zsh..."
chsh -s "$(which zsh)" "$TARGET_USER"

# --------- Finish ---------
echo ""
echo "✅ Installation complete!"
echo "User '$TARGET_USER' can now run:"
echo "  exec zsh"
echo "Or log in again with the same username, '$TARGET_USER'"
echo ""
echo "Run p10k setup? (y: yes):"

read -r OPTION
if [ "$OPTION" = "y" ]; then
  sudo -u "$TARGET_USER" zsh -i -c 'p10k configure'
else
  exit 0
fi

tfu
