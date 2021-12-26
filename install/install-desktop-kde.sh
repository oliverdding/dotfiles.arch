#!/bin/sh

set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR

exec 1> >(tee "stdout.extra.log")
exec 2> >(tee "stderr.extra.log" >&2)

install_package() {
    arch-chroot /mnt pacman -Sy --needed --noconfirm "$@"
}

systemctl_enable() {
    echo "systemctl enable "$1""
    arch-chroot /mnt systemctl enable "$1"
}

install_package mesa xf86-input-vmmouse xf86-video-vmware
install_package gstreamer gst-libav gst-plugins-base gst-plugin-pipewire gstreamer-vaapi
install_package plasma-desktop

systemctl_enable "sddm.service"
