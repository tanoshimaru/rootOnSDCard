# rootOnSDCard
Switch the rootfs to a SD Card on the Jetson AGX Xavier

These scripts install a service which runs at startup to point the rootfs to a SD Card installed on /dev/mmcblk1p1.

This is taken from the NVIDIA Jetson AGX Xavier forum https://forums.developer.nvidia.com/t/how-to-boot-from-nvme-ssd/65147/22, written by user crazy_yorik (https://forums.developer.nvidia.com/u/crazy_yorick). Thank you crazy_yorik!

This procedure should be done on a fresh install of the eMMC using JetPack 4.3+. Install the SD Card into the slot of the Jetson, and format it gpt, ext4, and setup a partition (p1). The AGX Xavier uses eMMC in the boot sequence.

Next, copy the rootfs of the eMMC to the SD Card
```
$ ./copy-rootfs-ssd.sh
```

Then, setup the service. This will copy the .service file to the correct location, and install a startup script to set the rootfs to the SSD.
```
$ ./setup-service.sh
```

After setting up the service, reboot for the changes to take effect.

### Boot Notes
These script changes the rootfs to the SD Card after the kernel image is loaded from the eMMC.

### Upgrading
Once this service is installed, the rootfs will be on the SD Card. If you upgrade to a newer version of L4T using OTA updates (using the NVIDIA .deb repository), you will need to also apply those changes to the SD Card that you are booting from.

Typically this involves copying the /boot* directory and /lib/modules/\<kernel name\>/ from the SSD to the SD Card. If they are different, then modules load will be 'tainted', that is, the modules version will not match the kernel version.
