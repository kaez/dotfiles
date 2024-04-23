# Dotfiles

Ce dépôt contient mes configurations personnelles pour Neovim, tmux, zsh, et kitty. Voici les instructions pour installer et configurer ces outils sur votre système.

## Prérequis

Avant de commencer, assurez-vous d'avoir `git` installé sur votre machine pour pouvoir cloner ce dépôt. Si vous n'avez pas `git`, vous pouvez l'installer avec la commande suivante (pour Ubuntu):

    sudo apt update && sudo apt install git

## Installation

Cloner le dépôt et installer les dotfiles :

    git clone git@github.com:kaez/dotfiles.git ~/dotfiles
    cd ~/dotfiles

## Configuration de Kitty

[Kitty](https://sw.kovidgoyal.net/kitty/) est un émulateur de terminal moderne, rapide et riche en fonctionnalités. Pour l'utiliser :

1. Assurez-vous d'avoir Kitty installé. Si non, vous pouvez l'installer via :
   ```bash
   sudo apt install kitty
   ```
2. Le fichier de configuration est lié dans le répertoire `.config/kitty` de votre dossier personnel.

## Configuration de Zsh et Oh My Zsh

`Zsh` est un interpréteur de commandes puissant, et `Oh My Zsh` est un framework pour gérer votre configuration zsh.

1. Installez Zsh avec :
   ```bash
   sudo apt install zsh
   ```
2. Rendez zsh votre shell par défaut :
   ```bash
   chsh -s $(which zsh)
   ```
3. Installer Oh My Zsh :
   ```bash
   sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
   ```

## Configuration de Tmux

`tmux` est un multiplexeur de terminal qui permet plusieurs sessions de terminal dans une seule fenêtre.

1. Installez tmux si ce n'est pas déjà fait :
   ```bash
   sudo apt install tmux
   ```
2. Les fichiers de configuration `.tmux.conf` et `.tmux.conf.local` sont dans votre répertoire personnel.

## Configuration de Neovim

`Neovim` est un éditeur de texte basé sur Vim, mais avec des fonctionnalités améliorées.

1. Installez Neovim avec :
   ```bash
   sudo apt install neovim
   ```
2. La configuration est située dans `~/.config/nvim`.

## Mises à jour

Pour mettre à jour vos configurations, tirez les dernières modifications du dépôt et relancez les scripts d'installation si nécessaire.

    cd ~/dotfiles
    git pull

## Contributions

Les contributions à ce dépôt sont les bienvenues. Si vous avez des suggestions ou des améliorations, n'hésitez pas à créer une issue ou un pull request.
