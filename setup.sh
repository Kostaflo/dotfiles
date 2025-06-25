#!/usr/bin/env bash

set -e

# Main CLI tools
echo "Installing main CLI tools..."
sudo pacman -Syu  --needed --noconfirm zsh neovim tmux fzf bat starship zoxide tldr stow

# Wayland-specific tools
echo "Installing Wayland-specific tools..."
sudo pacman -Syu  --needed --noconfirm wayabar wofi hyprpaper hyprshot hyprlock

if [ ! -f ".stow-local-ignore" ]; then
	git clone https://github.com/Kostaflo/dotfiles.git ~/dotfiles
	cd ~/dotfiles
fi

for dir in */; do
	if [ -d "$dir" ]; then
		echo "Stowing $dir..."
		stow "$dir"
	fi
done

chsh -s "$(which zsh)"

echo "Setup complete! Please log out and log in again to use zsh."
