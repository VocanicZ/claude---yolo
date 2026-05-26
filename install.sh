#!/usr/bin/env bash

# Detect shell
if [ -n "$ZSH_VERSION" ] || [[ "$SHELL" == *"zsh"* ]]; then
    CONFIG_FILE="$HOME/.zshrc"
else
    CONFIG_FILE="$HOME/.bashrc"
fi

# The wrapper function
WRAPPER_FUNC='
# Claude --yolo wrapper
claude() {
    local args=()
    for arg in "$@"; do
        if [[ "$arg" == "--yolo" ]]; then
            args+=("--dangerously-skip-permissions")
        else
            args+=("$arg")
        fi
    done
    command claude "${args[@]}"
}'

# Inject into config if it does not already exist
if grep -q "claude()" "$CONFIG_FILE"; then
    echo "Claude wrapper is already in $CONFIG_FILE"
else
    echo "$WRAPPER_FUNC" >> "$CONFIG_FILE"
    echo "Installed successfully! Please run 'source $CONFIG_FILE' or open a new terminal."
fi
