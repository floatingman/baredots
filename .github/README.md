# Dotfiles

## Prerequistes

- [BLESH](https://github.com/akinomyoga/ble.sh)
- [Starship](https://starship.rs)
- [TPM](https://github.com/tmux-plugins/tpm)

## Installing

```bash
git clone --bare https://github.com/floatingman/baredots.git ~/.dotfiles.git
alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
dotfiles submodule update --init --recursive
```
