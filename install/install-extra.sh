#!/bin/sh

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

exec 1> >(tee "stdout.extra.log")
exec 2> >(tee "stderr.extra.log" >&2)

# read .env
while read line; do export $line; done < .env

install_package() {
    arch-chroot /mnt pacman -Sy --needed --noconfirm "$@"
}

install_package helm kubectl kubectx
install_package clang gcc gdb lldb go python python-setuptools python-pip python-pipenv
install_package bandwhich bottom dua-cli gitui gping hexyl oha onefetch xplr procs miniserve
install_package cargo-flamegraph rustup
install_package wqy-microhei wqy-bitmapfont wqy-zenhei adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts adobe-source-code-pro-fonts adobe-source-sans-pro-fonts adobe-source-serif-pro-fonts noto-fonts noto-fonts-cjk

arch-chroot /mnt sudo -u ${USER} rustup toolchain add nightly-x86_64-unknown-linux-gnu
arch-chroot /mnt sudo -u ${USER} rustup default nightly-x86_64-unknown-linux-gnu
arch-chroot /mnt sudo -u ${USER} rustup component add llvm-tools-preview-x86_64-unknown-linux-gnu clippy-x86_64-unknown-linux-gnu rust-analyzer-preview-x86_64-unknown-linux-gnu rust-src

echo -e "\n### adding archlinuxcn"
echo -e '[archlinuxcn]\nServer = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >>/mnt/etc/pacman.conf
install_package archlinuxcn-keyring
rm -fr /mnt/etc/pacman.d/gnupg
arch-chroot /mnt pacman-key --init
arch-chroot /mnt pacman-key --populate archlinux
arch-chroot /mnt pacman-key --populate archlinuxcn
install_package yay nushell
install_package ttf-nerd-fonts-symbols-mono noto-fonts-emoji powerline-fonts nerd-fonts-fira-code nerd-fonts-jetbrains-mono nerd-fonts-source-code-pro nerd-fonts-ubuntu-mono
