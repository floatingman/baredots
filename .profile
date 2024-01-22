[ -f "$HOME"/.bashrc ] && source $HOME/.bashrc

[ -d $HOME/.local/bin ] && export PATH=$PATH:$HOME/.local/bin

[ -d /opt/homebrew ] && eval "$(homebrew/bin/brew shellenv)"
