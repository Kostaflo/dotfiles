#!/usr/bin/env bash

set -e

# Main CLI tools
echo "Installing main CLI tools..."
sudo pacman -Syu --needed --noconfirm zsh neovim tmux fzf bat starship zoxide tldr stow ghostty kitty

# Wayland-specific tools (hyprshot is in the extra repo)
echo "Installing Wayland-specific tools..."
sudo pacman -S --needed --noconfirm waybar wofi hyprpaper hyprshot hyprlock swaync rofi

# Clone & Setup dotfiles
if [ ! -d "$HOME/dotfiles" ]; then
    echo "Cloning dotfiles repository..."
    git clone https://github.com/Kostaflo/dotfiles.git "$HOME/dotfiles"
else
    echo "Dotfiles repository already exists in $HOME/dotfiles"
fi

cd "$HOME/dotfiles"

# Stow each directory safely to the home folder
for dir in */; do
    if [ -d "$dir" ]; then
        target_dir="${dir%/}"
        echo "Stowing $target_dir..."
        stow -t "$HOME" "$target_dir"
    fi
done

# Set default shell to zsh
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Changing default shell to zsh..."
    chsh -s "$(which zsh)"
fi

echo "Setup complete! Please log out and log in again to use zsh."
