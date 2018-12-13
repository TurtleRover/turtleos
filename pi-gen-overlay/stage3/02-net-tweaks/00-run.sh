#!/bin/bash -e

install -v -m 644 files/etc/*.conf	"${ROOTFS_DIR}/etc/"
install -v -m 644 files/etc/hostapd/hostapd.conf	"${ROOTFS_DIR}/etc/hostapd/"

install -v -m 644 files/etc/systemd/network/*.network	"${ROOTFS_DIR}/etc/systemd/network/"
install -v -m 644 files/etc/systemd/system/*.service	"${ROOTFS_DIR}/etc/systemd/system/"

install -v -m 644 files/etc/udev/rules.d/*.rules	"${ROOTFS_DIR}/etc/udev/rules.d/"

install -v -m 644 files/etc/NetworkManager/NetworkManager.conf	"${ROOTFS_DIR}/etc/NetworkManager/"

echo "=>Performing enabling/disabling of services"
on_chroot <<-EOF
    systemctl disable dhcpcd
    systemctl enable systemd-networkd
    systemctl enable hostapd
    systemctl enable NetworkManager
EOF
