if [ -f "$HOME/.bashrc" ]; then
	source "$HOME/.bashrc"
fi

[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

[ -d "$HOME/.local/bin" ] && export PATH=$PATH:"$HOME/.local/bin"

[ -d "$HOME/.bin" ] && export PATH=$PATH:"$HOME/.bin"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
[[ -s "$HOME/.pyenv/bin/pyenv" ]] && eval "$(pyenv init --path)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -d "$HOME/.local/share/JetBrains" ]] && export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
