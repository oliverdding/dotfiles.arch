#!/bin/sh

set -e
exec 2> >(while read line; do echo -e "\e[01;31m$line\e[0m"; done)

dotfiles_dir="$(
    cd "$(dirname "$0")"
    pwd
)"
cd "$dotfiles_dir"

#############
# Functions #
#############

link() {
    orig_file="$dotfiles_dir/$1"
    if [ -n "$2" ]; then
        dest_file="$HOME/$2"
    else
        dest_file="$HOME/$1"
    fi

    mkdir -p "$(dirname "$orig_file")"
    mkdir -p "$(dirname "$dest_file")"

    rm -rf "$dest_file"
    ln -s "$orig_file" "$dest_file"
    echo "$dest_file -> $orig_file"
}

#################
# Configuration #
#################

echo "##################"
echo "mkdir directory..."
echo "##################"

mkdir -p "$HOME"/.config/pg
mkdir -p "$HOME"/.cache/pg
mkdir -p $HOME/.local/share/bash
mkdir -p "$HOME"/.local/share/gnupg
mkdir -p "$HOME"/.local/share/ivy2
mkdir -p "$HOME"/.local/share/sbt

echo "##########################"
echo "linking user's dotfiles..."
echo "##########################"

link ".bash_profile"
link ".bashrc"

link ".config/bottom"
link ".config/Code - OSS/User/settings.json"
link ".config/environment.d"
link ".config/gdb/init"
link ".config/git/$(cut -d '-' -f1 /etc/hostname)" ".config/git/config"
link ".config/git/common"
link ".config/git/ignore"
link ".config/git/work"
link ".config/npm"
link ".config/nu"
link ".config/nvim"
#link ".config/onedrive/config"
link ".config/chrome-flags.conf"
link ".config/chromium-flags.conf"
link ".config/electron-flags.conf"
link ".config/electron12-flags.conf"
link ".config/starship.toml"
link ".config/wgetrc"

link ".local/bin/gdb"
link ".local/bin/gpg"
link ".local/bin/gpg" ".local/bin/gpg2"
link ".local/bin/grep"
link ".local/bin/ls"
link ".local/bin/sbt"
link ".local/bin/sqlite3"
link ".local/bin/wget"

link "Pictures/backgrounds"

echo "############################"
echo "configure others dotfiles..."
echo "############################"

echo "installing vim-plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


touch ~/.config/git/git-credentials
chmod 600 ~/.config/git/git-credentials
