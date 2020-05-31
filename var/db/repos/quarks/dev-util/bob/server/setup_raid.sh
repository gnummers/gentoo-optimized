#!/bin/bash

[ -r parted.txt ] || exit 1

parted -a opt /dev/sda -s $(cat parted.txt)
parted -a opt /dev/sdb -s $(cat parted.txt)
partprobe 
mdadm --create /dev/md0 --level=mirror --raid-devices=2 /dev/sda2 /dev/sdb2
mdadm --create /dev/md1 --level=mirror --raid-devices=2 /dev/sda3 /dev/sdb3

cryptsetup -v --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 5000 --use-random luksFormat /dev/md1
cryptsetup luksOpen /dev/md1 crypt_root

pvcreate /dev/mapper/crypt_root
vgcreate disks /dev/mapper/crypt_root
lvcreate -L16G /dev/mapper/disks -n root

mkfs.xfs -f /dev/md0
mkfs.xfs -f /dev/disks/root

mkdir -p /mnt/gentoo
mount /dev/disks/root /mnt/gentoo
mkdir -p /mnt/gentoo/boot
mount /dev/md0 /mnt/gentoo/boot
