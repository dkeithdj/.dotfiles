#!/bin/sh
# HISTFILE="$XDG_DATA_HOME"/zsh/history
HISTSIZE=1000000
SAVEHIST=1000000

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"

export LESSHISTFILE="-"

export ZDOTDIR=$HOME/.config/zsh

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="brave-browser-stable"
export PATH="$HOME/.local/bin":$PATH
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export PATH=$HOME/.cargo/bin:$PATH
export PATH="$HOME/.local/share/neovim/bin":$PATH
#export PATH="$PATH:./node_modules/.bin"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
export PATH="$HOME/.avm/bin:$PATH"
export PATH="$HOME/flutter/bin:$PATH"
export CHROME_EXECUTABLE="brave-browser-stable"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export PATH=$JAVA_HOME/bin:$PATH 

export MOZ_ENABLE_WAYLAND=1

export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet
export PATH="$PATH:$DOTNET_ROOT/tools"
export WINE_MASM_DIR=$HOME/wine-masm
