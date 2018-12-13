#!/bin/bash -e

echo "=> Downloading Gstreamer Typelibs..."

curl -L http://ftp.debian.org/debian/pool/main/g/gstreamer1.0/gir1.2-gstreamer-1.0_1.14.4-1_armhf.deb \
    --output "$ROOTFS_DIR"/tmp/install/gir1.2-gstreamer-1.0.deb
curl -L http://ftp.debian.org/debian/pool/main/g/gst-plugins-base1.0/gir1.2-gst-plugins-base-1.0_1.14.4-1_armhf.deb \
    --output "$ROOTFS_DIR"/tmp/install/gir1.2-gst-plugins-base-1.0.deb
curl -L http://ftp.debian.org/debian/pool/main/g/gst-plugins-bad1.0/gir1.2-gst-plugins-bad-1.0_1.14.4-1+b1_armhf.deb \
    --output "$ROOTFS_DIR"/tmp/install/gir1.2-gst-plugins-bad-1.0.deb

# extracting deb packages
mkdir "$ROOTFS_DIR"/tmp/install/gir
dpkg -x "$ROOTFS_DIR"/tmp/install/gir1.2-gstreamer-1.0.deb "$ROOTFS_DIR"/tmp/install/gir
dpkg -x "$ROOTFS_DIR"/tmp/install/gir1.2-gst-plugins-base-1.0.deb "$ROOTFS_DIR"/tmp/install/gir
dpkg -x "$ROOTFS_DIR"/tmp/install/gir1.2-gst-plugins-bad-1.0.deb "$ROOTFS_DIR"/tmp/install/gir

# copying needed typelibs
mkdir "$ROOTFS_DIR"/opt/gstreamer-1.0/lib/girepository-1.0

TYPELIBS="Gst GstSdp GstWebRTC"
for TL in $TYPELIBS; do
    cp "$ROOTFS_DIR"/tmp/install/gir/usr/lib/arm-linux-gnueabihf/girepository-1.0/${TL}-1.0.typelib \
        "$ROOTFS_DIR"/opt/gstreamer-1.0/lib/girepository-1.0
done
