#!/bin/sh
# Runs at startup, switches rootfs to the SD Card (mmcblk1p1)
NVME_DRIVE="/dev/mmcblk1p1"
CHROOT_PATH="/sdroot"

INITBIN=/lib/systemd/systemd
EXT4_OPT="-o defaults -o errors=remount-ro -o discard"

modprobe ext4

mkdir -p ${CHROOT_PATH}
mount -t ext4 ${EXT4_OPT} ${NVME_DRIVE} ${CHROOT_PATH}

cd ${CHROOT_PATH}
/bin/systemctl --no-block switch-root ${CHROOT_PATH}
