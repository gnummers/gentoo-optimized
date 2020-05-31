#!/bin/sh
set -e

export MAKEOPTS="-j$(nproc)"

cd /usr/src/linux

# make clean
# make oldconfig
make menuconfig
make all ${MAKEOPTS}
make modules_install

NEW=$(make kernelversion)
TARGET=/boot

# If EFI store kernel under EFI
[ -d /sys/firmware/efi ] && [ -d /boot/EFI/Gentoo ] && TARGET=/boot/EFI/Gentoo

dracut --xz -H --force --strip ${TARGET}/initrd-${NEW} ${NEW}

export INSTALL_PATH=${TARGET}
make install

# UEFI
if [ -d /sys/firmware/efi ]; then
    LUKS_UUID=$(blkid  | grep crypto_LUKS | awk '{print $2}' | uniq | sed -e 's/UUID=//' | sed -e 's/"//g')

    # Remove potential existing entries for this kernel
    BOOT_IDS=$(efibootmgr | grep Gentoo-${NEW} | awk '{print $1}' | sed 's/Boot\(.*\)\*/\1/')
    for b in $BOOT_IDS; do efibootmgr -b $b -B > /dev/null; done

    efibootmgr -c -L Gentoo-${NEW} -l /EFI/Gentoo/vmlinuz-${NEW} -u "initrd=/EFI/Gentoo/initrd-${NEW} root=/dev/mapper/disks-root ro quiet rd.luks.uuid=${LUKS_UUID} rd.lvm.vg=disks rd.luks.allow-discards libata.force=noncq acpi_osi="
else
    grub2-mkconfig -o ${TARGET}/grub/grub.cfg
    pushd ${TARGET} >/dev/null
    ln -sf System.map-${NEW} System.map
    popd > /dev/null
fi

echo "Building tools from within kernel sources..."
echo "  cpupower (requires pciutils):"
cd tools/power/cpupower && make ${MAKEOPTS}
cp -a cpupower /usr/local/bin
cp -a libcpupower.so* /usr/lib

echo "After successful boot of new kernel run:"
echo "   root # emerge @module-rebuild"
# eselect opengl set ati

cp /usr/src/linux/.config  /etc/kernel/kernel-config-${NEW} 
