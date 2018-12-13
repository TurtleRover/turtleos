#!/bin/bash -e

echo "=> Retrieving latest OpenOCD..."

URL=$(curl -sS --header "Authorization: token $GITHUB_TOKEN" \
     --header 'Accept: application/vnd.github.v3.raw' \
     https://api.github.com/repos/TurtleRover/turtleos-openocd/releases/latest | jq -r '.assets[0].browser_download_url')

curl -L $URL --output "$ROOTFS_DIR"/tmp/install/openocd.deb

on_chroot << EOF
apt install /tmp/install/openocd.deb
EOF
