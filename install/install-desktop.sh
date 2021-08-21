#!/bin/sh

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

exec 1> >(tee "stdout.extra.log")
exec 2> >(tee "stderr.extra.log" >&2)

install_package() {
    arch-chroot /mnt pacman -Sy --needed --noconfirm "$@"
}

install_package mako grim slurp xdg-desktop-portal-wlr
install_package sway waybar swayidle swaylock wofi
install_package alacritty
install_package brightnessctl pulseaudio pulseaudio-alsa pulseaudio-bluetooth

