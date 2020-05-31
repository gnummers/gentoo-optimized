#!/bin/bash

# - builds a generic image from a stage3 tarball and portage snapshot
#
# based on work from JD Harrington https://github.com/psi/gentoo-aws
# and Matsuu Takuto https://gist.github.com/870789

#===============================================================================
GENTOO_MIRROR="http://distfiles.gentoo.org"
LOCAL_CACHE=/var/tmp
CHROOT=/mnt/gentoo


set -o nounset

die() {
    echo $@
    exit 1
}


verify_digest() {
    local FILE_NAME=$1
    local TYPE=$2
    local DIGEST=$3
    local PURGE=$4

    case $TYPE in
        sha512)
            FILE_DIGEST=$(sha512sum ${FILE_NAME} | awk '{print $1}')
            ;;
        md5)
            FILE_DIGEST=$(md5sum ${FILE_NAME} | awk '{print $1}')
            ;;
        *)
            echo "Unknown DIGEST"
            return 1
            ;;
    esac

    if [ "${FILE_DIGEST}" = "${DIGEST}" ]; then
        echo "${TYPE} checksum for ${FILE_NAME} verified."
        return 0
    else
        echo "Invalid checksum for ${FILE_NAME}!"
        [ "x${PURGE}" != "x" ] && { echo "Removing cached copy." ; rm -f ${FILE_NAME}; }
        return 1
    fi
}


fetch_file() {
    local URL=$1
    local DIGEST_URL=$2

    local FILE_NAME=$(basename ${URL})

    local DIGEST_TYPE

    # Check cache
    if [ ! -d ${LOCAL_CACHE} ] || [ ! -w ${LOCAL_CACHE} ]; then
        echo "Cannot write to cache ${LOCAL_CACHE}"
        return 1
    fi

    # If DIGEST requested get it
    if [ ! -z ${DIGEST_URL} ]; then
        DIGEST=$(curl -s -S ${DIGEST_URL} | grep -A1 -e "^# SHA512 HASH" | grep -o -E -e "^[0-9a-f]{128} *${FILE_NAME}$" | awk '{print $1}')
        if [ -z ${DIGEST} ]; then
            # Let's try md5sum before giving up
            DIGEST=$(curl -s -S ${DIGEST_URL} | grep -o -E -e "^[0-9a-f]{32} *${FILE_NAME}$" | awk '{print $1}')
            if [ -z ${DIGEST} ]; then
                echo "Unable to get checksum for ${FILE_NAME}, abort"
                return 2
            fi
            DIGEST_TYPE="md5"
        else
            DIGEST_TYPE="sha512"
        fi
    fi

    # Do we have local copy
    if [ -f ${LOCAL_CACHE}/${FILE_NAME} ]; then
        verify_digest ${LOCAL_CACHE}/${FILE_NAME} $DIGEST_TYPE ${DIGEST} 1
        if [ $? -eq 0 ]; then
            cp ${LOCAL_CACHE}/${FILE_NAME} .
            echo "Using cached ${LOCAL_CACHE}/${FILE_NAME}"
            return 0
        fi
    fi

    # We we are here either we didnt have a copy or the cached file was invalid
    wget -q -O ${LOCAL_CACHE}/${FILE_NAME} ${URL}
    if [ $? -eq 0 ]; then
        echo "Downloaded ${URL} to ${LOCAL_CACHE}/${FILE_NAME}"

        verify_digest ${LOCAL_CACHE}/${FILE_NAME} $DIGEST_TYPE ${DIGEST} 1
        if [ $? -ne 0 ]; then
            echo "Could not get a verified version of ${FILE_NAME}"
            return 3
        fi
        cp ${LOCAL_CACHE}/${FILE_NAME} .
    else
        echo "Cannot download ${URL}!"
        return 4
    fi
}


# bootstrap, download stage3 and portage snapshot
bootstrap() {

    [ -d ${CHROOT} ] || die "${CHROOT} does not exists"
    [ -w ${CHROOT} ] || die "${CHROOT} isn't writable"

    pushd ${CHROOT} > /dev/null

    # first install stage 3
    if [ -d "usr" ] ; then
        echo "There seems to be already files in ${CHROOT} !"
        echo "Press <Ctrl+c> to abort, or <Return> to proceed without extracting stage3 ..."
        read -r REPLY
    else
        STAGE_TARBALL=${GENTOO_MIRROR}/releases/${ARCH}/autobuilds/$(curl -s ${LATEST_STAGE_FILE} | grep -v "^#" | awk '{print $1}' | head -n 1)

        fetch_file "${STAGE_TARBALL}" "${STAGE_TARBALL}.DIGESTS" || die "Cannot get ${STAGE_TARBALL}"

        echo "Extracting stage3 to ${CHROOT} ..."
        tar xpf $(basename ${STAGE_TARBALL}) || die "Extracting stage3 failed"

        rm -f $(basename ${STAGE_TARBALL})
    fi

    # Portage snapshot
    PORTAGE_SNAPSHOT="${GENTOO_MIRROR}/releases/snapshots/current/portage-latest.tar.bz2"
    _PORTAGE_MOUNTED=0

    if [ ${BIND_PORTAGE} -eq 1 ] ; then
        mkdir -p ${CHROOT}/usr/portage
        mount --bind /usr/portage ${CHROOT}/usr/portage || die "Error bind mounting /usr/portage"

        # Remember we mounted portage
        _PORTAGE_MOUNTED=1
    else
        # install latest portage snapshot
        if [ -d "usr/portage" ] ; then
            echo "There seems to be already portage files!"
            echo "Press <Ctrl+c> to abort, or <Return> to proceed without extracting portage ..."
            read -r REPLY
        else
            fetch_file "${PORTAGE_SNAPSHOT}" "${PORTAGE_SNAPSHOT}.md5sum"
            echo "Extracting latest portage snapshot to ${CHROOT}/usr ..."
            tar xf $(basename ${PORTAGE_SNAPSHOT}) -C "${CHROOT}/usr" || die "Extracting portage snapshot failed"
            rm -f portage-latest.tar.bz2
        fi
    fi

    popd
}


# setup_chroot CHROOT
setup_chroot() {

    # mount pseudo filesystems
    echo "Mounting pseudo filesystems..."
    mount -t proc none ${CHROOT}/proc || die "Error mounting /proc"
    mount --rbind /dev ${CHROOT}/dev || die "Error mounting /dev"
    mount --rbind /sys ${CHROOT}/sys || die "Error mounting /sys"

    # Needed at least to emerge python
    mkdir -p ${CHROOT}/run/shm && mount -t tmpfs none ${CHROOT}/run/shm

    # resolve.conf
    echo "Installing resolv.conf..."
    cp -L /etc/resolv.conf ${CHROOT}/etc/resolv.conf || die "Can't copy resolv.conf"
}


# Actually prepare the install script running within chroot
# and run it
# https://www.gentoo.org/doc/en/handbook/handbook-amd64.xml?full=1#book_part1_chap6
install_gentoo() {

    if [ ${INTERACTIVE} -eq 1 ]; then
        echo "Done. Entering chroot environment. All yours..."
        chroot ${CHROOT} /bin/bash
    else
        # Install make.conf
        if [ "x${MAKE_CONF}" != "x" ]; then
            [ -r ${MAKE_CONF} ] || die "Cannot read custom make.conf ${MAKE_CONF}"

            echo "Using custom make.conf"
            cp ${MAKE_CONF} ${CHROOT}/etc/portage/
        fi

        [ -r ${KERNEL_CONF} ] || die "Cannot read kernel config ${KERNEL_CONF}"
        cp ${KERNEL_CONF} ${CHROOT}/tmp/.config

        # From here we create the install script and execute it within the chroot at the end
        cat << 'EOF' > ${CHROOT}/tmp/install.sh
#!/bin/bash
set -e
source /etc/profile
export PS1="(chroot) $PS1"

CPUS=$(nproc)
[ $CPUS -ge 8 ] && JOBS="--jobs 4"
EOF
        # Sync portage if not mounted
        if [ ${_PORTAGE_MOUNTED} -eq 0 ]; then
        cat << 'EOF' >> ${CHROOT}/tmp/install.sh
echo "Syncing portage snapshot..."
emerge --sync --quiet
mkdir -p /usr/portage/distfiles
chown portage: /usr/portage/distfiles
EOF
        fi

        # eselect profile
        cat << EOF >> ${CHROOT}/tmp/install.sh
echo "Setting profile to ${ESELECT_PROFILE}"
eselect profile set ${ESELECT_PROFILE}

echo "Setting timezone to ${TIMEZONE}"
echo ${TIMEZONE} > /etc/timezone
emerge --config sys-libs/timezone-data

echo "Setting locale to C"
eselect locale set C
source /etc/profile

#echo "Setting linker to gold"
#binutils-config --linker ld.gold
EOF

        # Updating world, using our make.conf and settings
        cat << 'EOF' >> ${CHROOT}/tmp/install.sh
echo "Updating stage3 to latest versions and new USE flags..."
emerge --update --deep --newuse --accept-properties=-interactive --with-bdeps=y ${JOBS} world
dispatch-conf
EOF

        # Compile kernel

        # Unmask dracut
        echo "sys-kernel/dracut" >> ${CHROOT}/etc/portage/package.keywords

        # Disable dhcp server part
        echo "net-misc/dhcp -server" >> ${CHROOT}/etc/portage/package.use
        # Disable thin provisioning in order to NOT have to add boost
        echo "sys-fs/lvm2 -thin" >> ${CHROOT}/etc/portage/package.use

        # Dracut needs dhcp rather than dhcpcd
        cat << EOF >> ${CHROOT}/tmp/install.sh
echo "Installing kernel sources, dracut and dependencies..."
emerge -n sys-kernel/${KERNEL_FLAVOR}-sources
mv /tmp/.config /usr/src/linux

emerge -n ${JOBS} net-misc/dhcp net-misc/curl sys-apps/iproute2 sys-fs/cryptsetup app-crypt/gnupg sys-fs/lvm2 sys-fs/mdadm sys-boot/grub sys-kernel/dracut

# Stuff for encrypted root
emerge -n ${JOBS} net-misc/dropbear sys-fs/eudev
EOF
        # Now lets actually build and install the kernel incl. initrd
        cat << 'EOF' >> ${CHROOT}/tmp/install.sh
echo "Compiling custom kernel..."
cd /usr/src/linux
make olddefconfig
#make menuconfig
make all ${MAKEOPTS}
make modules_install

NEW=$(make kernelversion)

#Hack
cd ..
tar xfz /tmp/dracut.tgz
cd dracut
./dracut.sh -l --xz --force --strip -m "bash caps i18n terminfo base shutdown usrmount kernel-modules lvm mdraid crypt crypt-ssh rescue" /boot/initrd-${NEW} ${NEW}
cd ../linux

#dracut --xz --force --strip /boot/initrd-${NEW} ${NEW}

make install

pushd /boot >/dev/null
ln -sf System.map-${NEW} System.map
popd > /dev/null

echo "Installed custom kernel"

echo "Writing /etc/fstab"
echo -e "UUID=$(findmnt /boot -o uuid -n)\t/boot\txfs\tdiscard,noatime\t0 1" > /etc/fstab
echo -e "UUID=$(findmnt / -o uuid -n)\t/\txfs\tdiscard,noatime\t0 1" >> /etc/fstab

echo "Setting eth0 to dhcp"
echo 'config_eth0="dhcp"' > /etc/conf.d/net
cd /etc/init.d
ln -s net.lo net.eth0
rc-update add net.eth0 default

echo "Enabling sshd..."
rc-update add sshd default

echo "Installing various tools..."
emerge -n ${JOBS} sys-fs/xfsprogs sys-process/cronie app-admin/sudo app-editors/vim app-misc/screen app-portage/eix app-portage/gentoolkit net-misc/ntp app-admin/syslog-ng
rc-update add cronie default
rc-update add ntpd default
rc-update add lvm boot
rc-update add mdraid boot

echo "Finally installing grub bootloader on /dev/sda..."
echo -e "GRUB_HIDDEN_TIMEOUT=1" >> /etc/default/grub
echo -e "GRUB_HIDDEN_TIMEOUT_QUIET=true" >> /etc/default/grub
echo -e "GRUB_FORCE_HIDDEN_MENU=true" >> /etc/default/grub
echo -e "GRUB_DISABLE_RECOVERY=true" >> /etc/default/grub
echo -e "GRUB_TERMINAL=console" >> /etc/default/grub
echo -e "GRUB_CMDLINE_LINUX_DEFAULT=\"nosplash rd.luks.uuid=$(blkid  | grep crypto_LUKS | awk '{print $2}' | sed -e 's/UUID=//' | sed -e 's/"//g') rd.lvm.vg=disks rd.luks.allow-discards cgroup_disable=memory rd.ip=dhcp rd.neednet=1 rd.luks.ssh=1\"" >> /etc/default/grub

grub2-install /dev/sda
grub2-mkconfig -o /boot/grub/grub.cfg
EOF
        chmod 755 ${CHROOT}/tmp/install.sh
        chroot ${CHROOT} /tmp/install.sh

        echo "Done !"
        echo "Press <Return> to tear down the chroot environment once you are done."
        echo "And dont' forget to either drop /root/.ssh/authorized_keys or other means of access..."
        read -r REPLY

    fi
}


# Clean up host
cleanup() {
        for dir in proc dev sys; do
            umount -R ${CHROOT}/$dir 2> /dev/null
        done


    if [ ${_PORTAGE_MOUNTED} != 0 ]; then
        umount ${CHROOT}/usr/portage
    else
        rm -rf ${CHROOT}/usr/portage/distfiles/*
    fi

    # Clean up chroot
    rm -rf ${CHROOT}/tmp/*
    rm -rf ${CHROOT}/var/tmp/*
}


# print usage
usage() {
cat << EOF
Usage: $0 [options]

This script builds a full Gentoo chroot

OPTIONS:
-h Show this message
-a arch, either i686 or x86_64, defaults to uname -m
-p profile, [ hardened * | hardened-no-multilib | default ]
-t The timezone to use, default to UTC
-r chroot location (default $CHROOT )
-c local cache (default $LOCAL_CACHE)
-b bind mount portage tree from, instead of downloading portage snapshot
-i interactive, enter chroot only, do NOT run install script
-m use custom make.conf
-s kernel flavor, [ hardened | gentoo* ]
-k kernel .config used to build custom kernel
-d debug (set -x)
EOF
}


DEBUG=0
INTERACTIVE=0
MAKE_CONF=""
BIND_PORTAGE=0
while getopts ":a:p:t:r:c:m:bk:s:dhi" OPTIONS; do
    case $OPTIONS in
        a ) ARCH=$OPTARG;;
        p ) PROFILE=$OPTARG;;
        t ) TIMEZONE=$OPTARG;;
        d ) DEBUG=1;;
        b ) BIND_PORTAGE=1;;
        r ) CHROOT=$OPTARG;;
        c ) LOCAL_CACHE=$OPTARG;;
        i ) INTERACTIVE=1;;
        m ) MAKE_CONF=$OPTARG;;
        k ) KERNEL_CONF=$OPTARG;;
        s ) KERNEL_FLAVOR=$OPTARG;;
        ? )
            usage
            exit
            ;;
    esac
done

# Do some sanity checks first
if [ "$(id -u)" != "0" ]; then
    die "Sorry, but we need root permissions to create DEVICE nodes etc.!"
fi

ARCH=${ARCH-"$(uname -m)"}
PROFILE=${PROFILE="hardened"}
TIMEZONE=${TIMEZONE-"UTC"}
KERNEL_CONF=${KERNEL_CONF-"/usr/src/linux/.config"}
KERNEL_FLAVOR=${KERNEL_FLAVOR-"gentoo"}

if [ "${ARCH}" = "i686" ] ; then
    # Why do they use x86 here ? :(
    STAGE_PATH="${GENTOO_MIRROR}/releases/x86/autobuilds"
elif [ "${ARCH}" = "x86_64" ] ; then
    ARCH="amd64"
    STAGE_PATH="${GENTOO_MIRROR}/releases/${ARCH}/autobuilds"
elif [ "${ARCH}" = "amd64" ] ; then
    STAGE_PATH="${GENTOO_MIRROR}/releases/${ARCH}/autobuilds"
else
    die "Unknown architecture!"
fi

if [ "${PROFILE}" = "hardened" ] ; then
    LATEST_STAGE_FILE="${STAGE_PATH}/latest-stage3-${ARCH}-hardened.txt"
    ESELECT_PROFILE="hardened/linux/${ARCH}"
elif [ "${PROFILE}" = "hardened-no-multilib" ] ; then
    LATEST_STAGE_FILE="${STAGE_PATH}/latest-stage3-${ARCH}-hardened+nomultilib.txt"
    ESELECT_PROFILE="hardened/linux/${ARCH}/no-multilib"
elif [ "${PROFILE}" = "default" ] ; then
    LATEST_STAGE_FILE="${STAGE_PATH}/latest-stage3-${ARCH}.txt"
    ESELECT_PROFILE="default/linux/${ARCH}/13.0"
else
    die "Unknown profile!"
fi

if [ ${DEBUG} -eq 1 ]; then
    set -x
fi

bootstrap

# From here make sure we don't leave stuff around on the host
trap "cleanup" INT TERM EXIT

setup_chroot

install_gentoo
