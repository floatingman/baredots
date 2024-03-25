# Dotfiles

## Prerequistes

- [BLESH](https://github.com/akinomyoga/ble.sh)
- [Starship](https://starship.rs)

## Installing

```bash
git clone --bare https://github.com/floatingman/baredots.git ~/.dotfiles.git
alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
dotfiles submodule update --init --recursive
```

## Steps for setup
### Starship
```bash
curl -sS https://starship.rs/install.sh | sh
```

### BLESH
```bash
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git
make -C ble.sh install PREFIX=~/.local
```

### Zoxide
Install with package manager

For Example: Debian
```bash
sudo apt install zoxide
```

### MPV
MPV needs a some libraries for subtitle activities. On Arch this will be handled by my configuration management repo. For other Distros, you will need:

#### Subliminal
A python library for fetching subtitles from online providers

#### Certifi
A python library for handling security certifidates

#### Trash-Cli
A command line trash utility for deleting files

#### FFSubSync or ALass
Python libraries for handling subtitle syncronization
