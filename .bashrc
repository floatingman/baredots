# shellcheck shell=bash source=/dev/null

# Source global definitions
[[ -f /etc/bashrc ]] && . /etc/bashrc

# Load blesh
# if $_isarch; then
# 	[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach
# else
# 	[[ -d $HOME/.local/share/blesh ]] && source "$HOME/.local/share/blesh/ble.sh"
# fi

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

# if [[ $OSTYPE = darwin* ]] && [[ $TERM = tmux-256color ]]; then
# 	export TERMINFO="$HOME/.local/share/terminfo"
# 	if ! [[ $TERMINFO/74/tmux-256color -nt $HOME/.config/dotfiles/tmux-256color.terminfo ]]; then
# 		mkdir -p "$TERMINFO"
# 		/usr/bin/tic -x "$HOME/.config/dotfiles/tmux-256color.terminfo"
# 	fi
# fi

# Aliases
[[ -f ~/.config/shell/aliases ]] && . ~/.config/shell/aliases

# Functions
[[ -f ~/.config/shell/funcs ]] && . ~/.config/shell/funcs

# ASDF
[[ -f "$HOME/.asdf/asdf.sh" ]] && . "$HOME/.asdf/asdf.sh"
[[ -f "$HOME/.asdf/completions/asdf.bash" ]] && . "$HOME/.asdf/completions/asdf.bash"

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

# Load private things
[[ -f "$HOME/.bash_private" ]] && . "$HOME/.bash_private"

# Load zoxide
eval "$(zoxide init bash)"

# Load starship
eval "$(starship init bash)"

# Startup blesh
# [[ ${BLE_VERSION-} ]] && ble-attach

# Start Sway
#[ "$(tty)" = "/dev/tty1" ] && exec sway

if [[ ! "$PATH" == */home/dnewman/.fzf/bin* ]]; then
	PATH="${PATH:+${PATH}:}/home/dnewman/.fzf/bin"
fi

if [[ -d "$HOME/.fzf/bin/" ]]; then
	eval "$(fzf --bash)"
fi
