#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
	selected=$1
else
	selected=$(find -L ~/codes -mindepth 1 -maxdepth 2 -type d | fzf) || return
fi

if [[ -z $selected ]]; then
	exit 0
fi

selected_name=$(basename "$selected" | tr . _)

GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
BOLD='\033[1m'
NORMAL='\033[0m'

if [[ "$(pwd)" == "$selected" ]]; then
	echo " 📁 ${BLUE}already in${NORMAL} ${BOLD}$selected_name"
else
	echo " 📁 ${GREEN}going to${NORMAL} ${BOLD}$selected_name"
	cd $selected
fi
