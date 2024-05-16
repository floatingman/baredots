# Dotfiles

## Prerequistes

- [Starship](https://starship.rs)

## Installing

```bash
git clone --bare https://github.com/floatingman/baredots.git ~/.dotfiles.git
alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
if [ $? = 0 ]; then
  echo "Checked out dotfiles.";
  else
    echo "Backing up pre-existing dot files.";
    dotfiles checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
dotfiles submodule update --init --recursive
```

## Steps for setup
### Starship
```bash
curl -sS https://starship.rs/install.sh | sh
```

### FZF
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
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
Libraries for handling subtitle syncronization

FFSubSync can be installed in Unix OSs with something like `pipx`
Alass can be downloaded from it's github repo and put in your path [link](https://github.com/kaegi/alass)
