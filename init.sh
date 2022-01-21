#!/usr/bin/env bash

# Removing existing dotfiles
print "Removing existing dotfiles"
rm -rf ~/.zshrc ~/.vim ~/.vimrc ~/.config/nvim 2> /dev/null

# Install oh my Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Installing brew"
# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Install nvim
print "Install Nvim..."
if [[ `which nvim` == "/usr/local/bin/nvim"]]; then
    brew install nvim
else 
    brew reinstall nvim
fi

# Install Plug Manager
print "Install Plug manager..."
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

mkdir -p .config/nvim

# Install Golang
print "Install Golang..."
if [[ `which go` == "/usr/local/bin/go"]]; then
    brew install go
else 
    brew reinstall go
fi