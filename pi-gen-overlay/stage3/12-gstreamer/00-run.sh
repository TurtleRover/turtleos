#!/bin/bash -e

echo "=> Retrieving latest Gstreamer..."

URL=$(curl -sS --header "Authorization: token $GITHUB_TOKEN" \
     --header 'Accept: application/vnd.github.v3.raw' \
     https://api.github.com/repos/TurtleRover/turtleos-gstreamer/releases/latest | jq -r '.assets[1].browser_download_url')

mkdir -p "$ROOTFS_DIR"/tmp/install
curl -L $URL --output "$ROOTFS_DIR"/tmp/install/gstreamer.tar.bz2

mkdir -p "$ROOTFS_DIR"/opt/gstreamer-1.0
tar -xf "$ROOTFS_DIR"/tmp/install/gstreamer.tar.bz2 -C "$ROOTFS_DIR"/opt/gstreamer-1.0