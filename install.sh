#!/bin/bash

# Initialization of variables
backup_dir="$HOME/dotfiles_backup/$(date +%Y%m%d%H%M%S)"
log_file="$HOME/dotfiles_install.log"

# Function to check if software is installed
check_software() {
        if ! command -v $1 &>/dev/null; then
                echo "$1 is not installed. Please install it before continuing."
                exit 1
        fi
}

# Checking for necessary software
echo "Checking for required software..."
check_software "git"
check_software "nvim"
check_software "tmux"
check_software "zsh"
check_software "kitty"
echo "All necessary software is installed."

# Parameterization of the path to the dotfiles
DOTFILES_DIR="$HOME/dotfiles"
if [[ "$#" -eq 1 ]]; then
        DOTFILES_DIR=$1
fi
echo "Dotfiles directory: $DOTFILES_DIR"

# Creating the backup directory
echo "Creating backup directory..."
mkdir -p $backup_dir
echo "Existing configurations will be backed up in: $backup_dir"

# Backing up existing configurations
echo "Backing up existing configurations..."
cp -a ~/.config/nvim $backup_dir/nvim_backup 2>/dev/null || true
cp -a ~/.config/kitty $backup_dir/kitty_backup 2>/dev/null || true
cp -a ~/.tmux.conf $backup_dir/ 2>/dev/null || true
cp -a ~/.tmux.conf.local $backup_dir/ 2>/dev/null || true
cp -a ~/.zshrc $backup_dir/ 2>/dev/null || true
echo "Backup completed."

# Creating configuration directories if they don't exist
echo "Preparing configuration directories..."
mkdir -p ~/.config/nvim
mkdir -p ~/.config/kitty
echo "Directories are ready."

# Removing current configurations
echo "Cleaning up current configurations..."
rm -rf ~/.config/nvim
rm -f ~/.tmux.conf
rm -f ~/.tmux.conf.local
rm -f ~/.zshrc
rm -f ~/.config/kitty/kitty.conf
echo "Cleanup completed."

# Creating symbolic links
echo "Creating symbolic links..."
ln -s $DOTFILES_DIR/nvim ~/.config/nvim
ln -s $DOTFILES_DIR/.tmux/.tmux.conf ~/
ln -s $DOTFILES_DIR/.tmux/.tmux.conf.local ~/
ln -s $DOTFILES_DIR/.zshrc ~/
ln -s $DOTFILES_DIR/kitty/kitty.conf ~/.config/kitty/kitty.conf
echo "Symbolic links successfully created."

echo "Installation completed! Your dotfiles have been configured." | tee -a $log_file
echo "All configuration files are backed up in $backup_dir." | tee -a $log_file

