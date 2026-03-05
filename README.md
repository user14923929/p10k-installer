# Zsh + Oh My Zsh + Powerlevel10k Installer

This script installs:

-   **Zsh**
-   **Oh My Zsh**
-   **Powerlevel10k theme**
-   Sets Zsh as the default shell

The script must be run as **root** (using sudo).\
It automatically installs everything for the user who invoked sudo.

------------------------------------------------------------------------

## Installation

``` bash
sudo curl -fsSL https://raw.githubusercontent.com/user14923929/p10k-installer/refs/heads/master/main.sh | bash
```

------------------------------------------------------------------------

## After Installation

Start Zsh:

``` bash
exec zsh
```

On first launch, the Powerlevel10k configuration wizard will appear.

------------------------------------------------------------------------

## Requirements

-   Debian / Ubuntu / antiX (APT-based systems)
-   Internet connection
-   sudo privileges

------------------------------------------------------------------------

## What the Script Does

1.  Updates package lists
2.  Installs `zsh`, `git`, and `curl`
3.  Installs Oh My Zsh
4.  Clones Powerlevel10k theme
5.  Sets Powerlevel10k as the default theme
6.  Changes the user's default shell to Zsh

------------------------------------------------------------------------

## Notes

-   The script detects the real user via `$SUDO_USER`
-   It does not overwrite existing installations
-   Safe to re-run if needed

------------------------------------------------------------------------

Enjoy your upgraded terminal 🚀


---

## License

MIT License - <a href="https://github.com/user14923929/p10k-installer/blob/master/LICENSE">See</a> LICENSE file for details