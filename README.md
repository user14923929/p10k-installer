# p10k-installer Termux Edition

This script installs:

-   **Zsh**
-   **Oh My Zsh**
-   **Powerlevel10k theme**
-   Sets Zsh as the default shell

------------------------------------------------------------------------

## Installation

``` bash
curl -fsSL https://raw.githubusercontent.com/user14923929/p10k-installer/refs/heads/termux-standlone/main.sh | bash
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

-   Android 7.0+
-   Termux
-   Internet connection

------------------------------------------------------------------------

## What the Script Does

1.  Updates package lists
2.  Installs `zsh` and `git`
3.  Installs Oh My Zsh
4.  Clones Powerlevel10k theme
5.  Sets Powerlevel10k as the default theme
6.  Changes the user's default shell to Zsh

------------------------------------------------------------------------

## Notes

-   It does not overwrite existing installations
-   Safe to re-run if needed

------------------------------------------------------------------------

Enjoy your upgraded terminal 🚀


---

## License

MIT License - <a href="https://github.com/user14923929/p10k-installer/blob/master/LICENSE">See</a> LICENSE file for details