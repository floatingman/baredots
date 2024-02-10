#
# Terminal
#

export TERMINAL='alacritty'

#
# Editors
#

export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'

#
# Language
#

export LANG='en_US.UTF-8'

[ -d "$HOME/.local/bin" ] && export PATH=$PATH:"$HOME/.local/bin"

[ -d "$HOME/bin" ] && export PATH=$PATH:"$HOME/bin"

# Disable QT5 DPI scaling
export QT_AUTO_SCREEN_SCALE_FACTOR=0

# Set GPG TTY
# export GPG_TTY
# GPG_TTY=$(tty)

# Use GPG for SSH Agent
# unset SSH_AGENT_PID
# if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
# 	export SSH_AUTH_SOCK
# 	SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
# fi

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
[[ -s "$HOME/.pyenv/bin/pyenv" ]] && eval "$(pyenv init --path)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

[[ -d "$HOME/.local/share/JetBrains" ]] && export PATH="$PATH:$HOME/.local/share/JetBrains/Toolbox/scripts"
