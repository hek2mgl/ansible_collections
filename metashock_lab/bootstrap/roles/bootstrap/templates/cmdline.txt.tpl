console=serial0,115200 console=tty1 root=PARTUUID={{ bootstrap_rootfs_partuuid }} rootfstype=ext4 fsck.repair=yes rootwait cgroup_memory=1 cgroup_enable=memory
