# shellcheck shell=bash source=/dev/null

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

# Load blesh
[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach

# User specific aliases, environment, and functions
homebrew="$(command -v {/opt/homebrew,/usr/local}/bin/brew 2>/dev/null)"
if [[ -n $homebrew ]]; then
	if [[ -z ${HOMEBREW_REPOSITORY+x} ]]; then
		# shellcheck disable=SC2046
		eval $(env -i HOME="$HOME" "$homebrew" shellenv)
	else
		# shellcheck disable=SC2046
		eval $(env -i HOME="$HOME" "$homebrew" shellenv | grep -w PATH=)
	fi
fi
unset homebrew

if [[ $OSTYPE = darwin* ]] && [[ $TERM = tmux-256color ]]; then
	export TERMINFO="$HOME/.local/share/terminfo"
	if ! [[ $TERMINFO/74/tmux-256color -nt $HOME/.config/dotfiles/tmux-256color.terminfo ]]; then
		mkdir -p "$TERMINFO"
		/usr/bin/tic -x "$HOME/.config/dotfiles/tmux-256color.terminfo"
	fi
fi

# Aliases
[[ -f ~/.config/shell/aliases ]] && . ~/.config/shell/aliases

# Functions
[[ -f ~/.config/shell/funcs ]] && . ~/.config/shell/funcs

alias dotfiles='git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'
[[ $(type -t __git_complete) = function ]] && __git_complete dotfiles git

# History
FIGNORE=DS_Store
HISTCONTROL=ignoredups:erasedups
HISTSIZE=500000
HISTFILESIZE=50000000
HISTTIMEFORMAT="%F %T  "
shopt -s checkwinsize histappend

# Directory Navigation
shopt -s autocd

# Don't overwrite existing files by redirection
set -o noclobber

# Prompt
#__prompt_command() {
#    local exit=$?
#
#    PS1="\n\[\e[48;2;24;24;37m\]\[\e[K\]"
#    PS1+="\[\e[38;2;137;180;250m\]${HOSTNAME%.*}\[\e[39m\]"
#    if [[ $exit != 0 ]]; then
#        PS1+="  \[\e[38;2;235;160;172m\]$exit\[\e[39m\]"
#    else
#        PS1+="  \[\e[38;2;166;227;161m\]$exit\[\e[39m\]"
#    fi
#    PS1+="  \[\e[38;2;245;224;220;3m\]\w"
#    # newline, clear the line, move the cursor up, and newline again
#    # this ensures the shell does not clear the line when redrawing the prompt line
#    PS1+="\n\[\e[0m\]\[\e[K\]\[\e[F\]\n"
#    PS1+="\[\e[38;2;180;190;254m\]\$\[\e[0m\] "
#}
#PROMPT_COMMAND=__prompt_command
# Load zoxide
eval "$(zoxide init bash)"

# Load starship
eval "$(starship init bash)"

#Startup blesh
[[ ${BLE_VERSION-} ]] && ble-attach
