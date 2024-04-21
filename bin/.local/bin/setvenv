#!/usr/bin/env bash

VENV_DIR="venv"

if [[ ! -d "$VENV_DIR" ]]; then
	echo "🐍 Creating virtual environment..."
	python -m venv $VENV_DIR
fi

if [[ -z "$VIRTUAL_ENV" ]]; then
	echo "🐍 Activating virtual environment..."
	source $VENV_DIR/bin/activate
else
	echo "🐍 Virtual environment already active"
fi
