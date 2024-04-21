#!/bin/bash
[ -f "$HOME/.local/share/zap/zap.zsh" ] && source "$HOME/.local/share/zap/zap.zsh"

# history
HISTFILE=~/.zsh_history

# source
plug "$HOME/.config/zsh/aliases.zsh"
plug "$HOME/.config/zsh/exports.zsh"

# plugins
# plug "esc/conda-zsh-completion"
plug "zsh-users/zsh-autosuggestions"
plug "hlissner/zsh-autopair"
plug "zap-zsh/supercharge"
plug "zap-zsh/vim"
# plug "spaceship-prompt/spaceship-prompt"
# plug "zap-zsh/atmachine-prompt"
plug "zap-zsh/zap-prompt"
# plug "wintermi/zsh-starship"
plug "zap-zsh/fzf"
plug "Aloxaf/fzf-tab"
plug "zap-zsh/exa"
plug "zsh-users/zsh-syntax-highlighting"
plug "MichaelAquilina/zsh-you-should-use"
plug "esc/conda-zsh-completion"

setopt share_history

# bindkey -s '^f' 'tmux-sessionizer\r'
bindkey -s '^f' '. cd-project\r'

bindkey "^p" up-line-or-beginning-search # Up
bindkey "^n" down-line-or-beginning-search # Down
bindkey "^k" up-line-or-beginning-search # Up
bindkey "^j" down-line-or-beginning-search # Down
bindkey -r "^u"
bindkey -r "^d"

export PATH="$HOME/.local/bin":$PATH

export VISUAL=nvim
export EDITOR=nvim

# eval "$(starship init zsh)"

# pipx
autoload -U bashcompinit
bashcompinit
eval "$(register-python-argcomplete pipx)"

fpath+=~/.zfunc
autoload -Uz compinit && compinit

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#


# bun completions
[ -s "/home/denrei/.bun/_bun" ] && source "/home/denrei/.bun/_bun"
