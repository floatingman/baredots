# BEGIN ANSIBLE MANAGED BLOCK
if [ -f ~/.bashrc ]; then
	source ~/.bashrc
fi
# END ANSIBLE MANAGED BLOCK
# BEGIN ANSIBLE MANAGED BLOCK: pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
# END ANSIBLE MANAGED BLOCK: pyenv

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
