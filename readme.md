# Dotfiles

This repository contains my personal configurations for Neovim, tmux, zsh, and kitty. Below are the instructions to install and configure these tools on your system.

## Prerequisites

Before starting, make sure you have `git` installed on your machine to clone this repository. If you do not have `git`, you can install it using the following command (for Ubuntu):

    sudo apt update && sudo apt install git

## Installation

Clone the repository:

    git clone https://your-repo/dotfiles.git ~/dotfiles
    cd ~/dotfiles

## Kitty Configuration

Kitty is a modern, fast, and feature-rich terminal emulator. To use it:

1. Install Kitty:
   ```
   sudo apt install kitty
   ```

## Zsh and Oh My Zsh Configuration

Zsh is a powerful command interpreter, and Oh My Zsh is a framework for managing your zsh configuration.

1. Install Zsh:
   ```
   sudo apt install zsh
   ```
2. Make zsh your default shell:
   ```
   chsh -s $(which zsh)
   ```
3. Install Oh My Zsh:
   ```
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

## Tmux Configuration

tmux is a terminal multiplexer that allows for multiple terminal sessions in one window.

1. Install tmux:
   ```
   sudo apt install tmux
   ```

## Neovim Configuration

Neovim is a text editor based on Vim, but with improved features.

1. Install Neovim:
   ```
   sudo apt install Neovim
   lazyvim require neovim => 0.8.0
   or try sudo snap install nvim
   ```

## Apply the configurations

After installing the necessary software, run the installation script to apply the configurations:

    chmod +x install.sh
    ./install.sh

## Updates

To update your configurations, pull the latest changes from the repository and rerun the installation scripts if necessary.

    cd ~/dotfiles
    git pull

## Contributions

Contributions to this repository are welcome. If you have suggestions or improvements, feel free to create an issue or a pull request.
