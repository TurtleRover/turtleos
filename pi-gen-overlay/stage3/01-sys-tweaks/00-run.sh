#!/bin/bash -e

on_chroot << EOF
rm /etc/motd
rm /etc/update-motd.d/10-uname
EOF

install -m 644 files/etc/turtleos_version "$ROOTFS_DIR"/etc/
install -m 755 files/etc/update-motd.d/* "$ROOTFS_DIR"/etc/update-motd.d/
install -m 644 files/etc/modules-load.d/* "$ROOTFS_DIR"/etc/modules-load.d/

DATE=$(date +"%Y%m%d")
sed -i "/BUILD_ID=/s/$/$DATE/" "$ROOTFS_DIR"/etc/turtleos_version
