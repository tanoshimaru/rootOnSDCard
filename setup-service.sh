#!/bin/sh
# Setup the service to set the rootfs to point to the SD Card
sudo cp data/setsdroot.service /etc/systemd/system
sudo cp data/setsdroot.sh /sbin
sudo chmod 777 /sbin/setsdroot.sh
systemctl daemon-reload
sudo systemctl enable setsdroot.service

# Copy these over to the SD Card
sudo cp /etc/systemd/system/setsdroot.service /mnt/etc/systemd/system/setsdroot.service
sudo cp /sbin/setsdroot.sh /mnt/sbin/setsdroot.sh

# Create setsdroot.conf which tells the service script to set the rootfs to the SD Card
# If you want to boot from SD again, remove the file /etc/setsdroot.conf from the eMMC.
# touch creates an empty file
sudo touch /etc/setsdroot.conf
echo 'Service to set the rootfs to the SD Card installed.'
echo 'Make sure that you have copied the rootfs to SD Card.'
echo 'Reboot for changes to take effect.'

