#!/bin/sh

set -e

sudo vmdebootstrap \
 --owner $(whoami) --verbose \
 --mirror http://http.debian.net/debian \
 --log beaglebone-black.log --log-level debug \
 --arch armhf \
 --foreign /usr/bin/qemu-arm-static \
 --enable-dhcp \
 --configure-apt \
 --no-extlinux \
 --no-kernel \
 --package u-boot \
 --package linux-image-armmp \
 --distribution sid \
 --serial-console-command "'/sbin/getty -L ttyO0 115200 vt100'" \
 --customize "beagleboneblack-customise.sh" \
 --bootsize 50m --boottype vfat \
 "$@"
