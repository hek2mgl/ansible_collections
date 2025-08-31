proc            /proc           proc    defaults          0       0
PARTUUID={{ bootstrap_bootfs_partuuid }}  /boot/firmware  vfat    defaults          0       2
PARTUUID={{ bootstrap_rootfs_partuuid }}  /               ext4    defaults,noatime  0       1
PARTUUID={{ bootstrap_datafs_partuuid }}  /srv            ext4    defaults,noatime  0       1
