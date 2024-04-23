#!/bin/bash

# Initialisation des variables
backup_dir="$HOME/dotfiles_backup/$(date +%Y%m%d%H%M%S)"
log_file="$HOME/dotfiles_install.log"

# Fonction pour vérifier si un logiciel est installé
check_software() {
	if ! command -v $1 &>/dev/null; then
		echo "$1 n'est pas installé. Veuillez l'installer avant de continuer."
		exit 1
	fi
}

# Vérification des logiciels nécessaires
check_software "git"
check_software "nvim"
check_software "tmux"
check_software "zsh"
check_software "kitty"

# Paramétrisation du chemin vers les dotfiles
DOTFILES_DIR="$HOME/dotfiles"
if [[ "$#" -eq 1 ]]; then
	DOTFILES_DIR=$1
fi

# Création du répertoire de sauvegarde
mkdir -p $backup_dir
echo "Début de l'installation $(date)" >>$log_file

# Sauvegarde des configurations existantes
cp -a ~/.config/nvim $backup_dir/nvim_backup 2>/dev/null || true
cp -a ~/.config/kitty $backup_dir/kitty_backup 2>/dev/null || true
cp -a ~/.tmux.conf $backup_dir/ 2>/dev/null || true
cp -a ~/.tmux.conf.local $backup_dir/ 2>/dev/null || true
cp -a ~/.zshrc $backup_dir/ 2>/dev/null || true

# Création des répertoires de configuration s'ils n'existent pas
mkdir -p ~/.config/nvim
mkdir -p ~/.config/kitty

# Suppression des configurations actuelles
rm -f ~/.config/nvim
rm -f ~/.tmux.conf
rm -f ~/.tmux.conf.local
rm -f ~/.zshrc
rm -f ~/.config/kitty/kitty.conf

# Création des liens symboliques
ln -s $DOTFILES_DIR/nvim ~/.config/nvim
ln -s $DOTFILES_DIR/.tmux/.tmux.conf ~/
ln -s $DOTFILES_DIR/.tmux/.tmux.conf.local ~/
ln -s $DOTFILES_DIR/.zshrc ~/
ln -s $DOTFILES_DIR/kitty/kitty.conf ~/.config/kitty/kitty.conf

echo "Installation terminée! Vos dotfiles ont été configurés." >>$log_file
echo "Tous les fichiers de configuration sont sauvegardés dans $backup_dir."
