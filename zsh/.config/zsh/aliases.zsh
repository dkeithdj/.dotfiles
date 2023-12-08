#!/bin/sh
alias g='lazygit'
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias reload='source .zshrc'

alias nvimrc='nvim ~/.config/nvim/'
alias v=nvim

alias luamake=/home/dkeith/tools/lua-language-server/3rd/luamake/luamake

alias ddrive='cd /mnt/d'
alias cdrive='cd /mnt/c/Users/DenreiK'

# alias python='python3.8'
# alias python='python.exe'
# alias pip='pip'
alias clangd='clangd-12'

# Colorize grep output (good for log files)
alias \
  grep='grep --color=auto' \
  egrep='egrep --color=auto' \
  fgrep='fgrep --color=auto' \
  ls="ls -hN --color=auto --group-directories-first"

# confirm before overwriting something
alias \
	cp="cp -iv" \
	mv="mv -iv" \
	rm="rm -vI" \
	bc="bc -ql" \
	mkd="mkdir -pv"

# go edit file
alias \
  cfn='cd $DOTFILES/nvim/.config/nvim && $EDITOR .' \
  cfz='cd $ZDOTDIR && $EDITOR .zshrc' \
  cft='cd $HOME && $EDITOR .tmux.conf' \
  cdf='cd $DOTFILES' \
  cfr='fd --type d . --hidden --exclude .git --exclude .vscode --exclude node_modules | fzf  --prompt=' Choose Dir: ' --layout=reverse --border=sharp --exit-0' \

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB
