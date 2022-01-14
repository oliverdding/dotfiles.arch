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

mkdir -p "$HOME"/.ssh
mkdir -p "$HOME"/.local/state/bash
mkdir -p "$HOME"/.local/share/fonts
mkdir -p "$HOME"/.local/share/icons
mkdir -p "$HOME"/.local/share/pass
mkdir -p "$HOME"/.local/share/themes
mkdir -p "$HOME"/.local/share/git
touch $HOME/.local/share/git/git-credentials

echo "##########################"
echo "linking user's dotfiles..."
echo "##########################"

link ".bash_profile"
link ".bashrc"

link ".config/alacritty"
link ".config/bottom"
link ".config/Code - OSS/User/settings.json"
link ".config/docker/config.json"
link ".config/environment.d"
link ".config/gdb/init"
link ".config/git/config"
link ".config/git/common"
link ".config/git/ignore"
link ".config/git/work"
link ".config/k9s/skin.yml"
link ".config/npm"
link ".config/pip/pip.conf"
link ".config/ripgrep/config"
link ".config/zellij"
link ".config/chrome-flags.conf"
link ".config/chromium-flags.conf"
link ".config/electron-flags.conf"
link ".config/electron12-flags.conf"
link ".config/starship.toml"

link ".local/bin/gdb"
link ".local/bin/gpg"
link ".local/bin/gpg" ".local/bin/gpg2"
link ".local/bin/ls"
link ".local/bin/sqlite3"

link ".local/share/cargo/config"
link ".local/share/gnupg/dirmngr.conf"
link ".local/share/gnupg/gpg-agent.conf"
link ".local/share/gnupg/gpg.conf"
link ".local/share/gradle/init.gradle.kts"

link ".m2/settings.xml"
link ".sbt/repositories"

chmod 700 $HOME/.ssh
chmod 700 $HOME/.local/share/gnupg
chmod 700 $HOME/.local/share/pass
chmod 700 $HOME/.local/share/git/git-credentials

echo "############################"
echo "configure others dotfiles..."
echo "############################"

if [[ -d "$HOME/.config/nvim" ]]; then git -C $HOME/.config/nvim pull; else git clone https://github.com/NvChad/NvChad.git  --depth 1 $HOME/.config/nvim; fi
link ".config/nvim/lua/custom"
