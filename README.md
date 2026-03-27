# 🐚 Zsh + Oh My Zsh + Powerlevel10k Installer (v2)

```
   ____       _    __  __ _       _ _           
  |  _ \ __ _| | _|  \/  (_)_ __ (_) | ___  ___
  | |_) / _` | |/ / |\/| | | '_ \| | |/ _ \/ __|
  |  __/ (_| |   <| |  | | | | | | | |  __/\__ \
  |_|   \__,_|_|\_\_|  |_|_|_| |_|_|_|\___||___/
```

A friendly, one-command installer for a **fully-featured Zsh terminal**:

* **Zsh**
* **Oh My Zsh**
* **Powerlevel10k theme**
* **MesloLGS Nerd Fonts** (icons and symbols)
* Sets Zsh as the default shell

It runs **as root** (via sudo) and installs everything for the user who invoked sudo. 🎉

---

## 🚀 Installation

```bash
curl -fsSL https://raw.githubusercontent.com/user14923929/p10k-installer/refs/heads/master/main.sh | sudo bash
```

---

## 🎨 After Installation

Start Zsh:

```bash
exec zsh
```

On first launch, the **Powerlevel10k configuration wizard** will appear.
Fonts are installed automatically, so icons and symbols will display correctly. ✨

---

## 🖥 Supported Systems

* Debian / Ubuntu / antiX (APT-based systems)
* Arch Linux / Manjaro (Pacman-based systems)
* Fedora / RHEL / CentOS (DNF-based systems)
* Internet connection
* sudo privileges

---

## 🔧 What the Script Does

1. Detects the real user via `$SUDO_USER`
2. Creates a backup of the user's existing `.zshrc` 💾
3. Updates package lists
4. Installs dependencies: `zsh`, `git`, `curl`
5. Installs Oh My Zsh (if not already installed) 🐚
6. Clones Powerlevel10k theme into Oh My Zsh custom themes 🎨
7. Sets Powerlevel10k as the default theme in `.zshrc`
8. Installs MesloLGS Nerd Fonts for full icon support 🔤
9. Changes the user's default shell to Zsh 🔄
10. Prompts to run `p10k configure` for theme setup

---

## ✨ Quick Terminal Customization Guide

After installing, you can make your terminal look even cooler with a few steps:

### 1. Change Font in Terminal Emulator

* Open your terminal settings
* Set the font to **MesloLGS NF** (Regular, Bold, Italic, or Bold Italic)
* Enable **“Use system font” or “Custom font”** option if needed

### 2. Customize Colors

* Use **Solarized**, **Gruvbox**, or **Dracula** terminal themes
* In most emulators, import the `.terminal` or `.itermcolors` file (downloadable online)
* Alternatively, change colors in **Preferences → Colors**

### 3. Adjust Prompt Style

* Run the wizard anytime:

```bash
p10k configure
```

* Choose **classic, rainbow, lean, or lean-lean style**
* Enable/disable icons, battery, time, and VCS info

### 4. Optional Plugins

* Edit `~/.zshrc` and enable plugins like:

```text
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

* Then reload Zsh:

```bash
source ~/.zshrc
```

### 5. Enjoy

* Your terminal now has:

  * Powerlevel10k theme
  * Nerd fonts with icons
  * Optional plugins
  * Custom colors

---

## ⚠️ Notes

* Safe to re-run the script; it does not overwrite existing installations
* Works for multiple Linux distributions 🌍
* Fonts are installed locally in the user's home directory (`~/.local/share/fonts`)
* Friendly messages and progress updates appear during installation 😎

---

Enjoy your **upgraded terminal**! 🚀💻

---

## 📜 License

MIT License - [See LICENSE](https://github.com/user14923929/p10k-installer/blob/master/LICENSE)
