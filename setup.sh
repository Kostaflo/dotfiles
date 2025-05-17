#!/usr/bin/env bash

set -e

# Main CLI tools
sudo pacman -Syu  --needed --noconfirm \
	zsh neovim tmux fzf bat starship zoxide tldr stow

# Wayland-specific tools
sudo pacman -Syu  --needed --noconfirm \
	wayabar wofi


