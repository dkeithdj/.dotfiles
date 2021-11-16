#!/usr/bin/env bash
HISTFILE=~/.cache/zsh/.zsh_history
source $HOME/.zprofile
setopt appendhistory

# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

# beeping is annoying
unsetopt BEEP

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion::complete:lsof:*' menu yes select
zmodload zsh/complist
# compinit
_comp_options+=(globdots)		# Include hidden files.

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

# [ -z "$TMUX"  ] && { tmux attach || exec tmux new-session;}

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-vim-mode"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "hlissner/zsh-autopair"

# Key-bindings
# bindkey -s '^t' 'nvim $(fzf)^M'
# bindkey -s '^v' 'nvim\n'

bindkey -s '^f' 'tmux-sessionizer\r'

bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"

# Setup fzf
# ---------
if [[ ! "$PATH" == */home/dkeith/tools/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/dkeith/tools/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/dkeith/tools/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/dkeith/tools/.fzf/shell/key-bindings.zsh"

compinit

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp" >/dev/null
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd^M'
# Environment variables set everywhere
export EDITOR="nvim"

