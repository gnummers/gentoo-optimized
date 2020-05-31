#!/bin/bash

parted -a opt /dev/sda -s $(cat parted.txt)
partprobe 

pvcreate /dev/sda3
vgcreate disks /dev/sda3
lvcreate -L16G /dev/mapper/disks -n root

mkfs.xfs -f /dev/sda2
mkfs.xfs /dev/disks/root

mkdir /mnt/gentoo
mount /dev/disks/root /mnt/gentoo
mkdir /mnt/gentoo/boot
mount /dev/sda2 /mnt/gentoo/boot
