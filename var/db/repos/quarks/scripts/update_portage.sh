#!/bin/sh
#set -x

# Default portage location
PORTAGE="/usr/portage"
# By default store SquashFS backing file under /mnt/portage
SQFS_PORTAGE="/mnt/portage/portage.sqfs"

# Store temporary overlayFS within portage tmpdir
OVERLAY="$(portageq envvar PORTAGE_TMPDIR)/portage.overlayfs"
OVERLAY_NAME=portage_overlay

usage () {
    cat << EOF
Usage: $0 [-p portage_tree] [-s squashfs_file]
EOF
    exit 0
}

# mount squashed portage incl. writeable overlay
mount_overlay () {
    # Make sure backing tree is mounted, try to mount otherwise
    mountpoint -q ${PORTAGE} || mount ${PORTAGE} && echo "Mounted ${PORTAGE}."

    # mount the overlay on top of existing live portage tree 
    mkdir -p ${OVERLAY} ${OVERLAY}.work
    mount | grep -q ${OVERLAY_NAME} || mount -t overlay ${OVERLAY_NAME} \
      -olowerdir=${PORTAGE},upperdir=${OVERLAY},workdir=${OVERLAY}.work \
      ${PORTAGE} && echo "Mounted Overlay file system." 
}

# umount overlay and clean up temp dirs
umount_overlay () {
    mount | grep -q ${OVERLAY_NAME}
    if [ $? -eq 0 ]; then
        umount ${OVERLAY_NAME} && rm -rf ${OVERLAY} ${OVERLAY}.work
        echo "Overlay file system unmounted."
    fi
}

# umount current, replace and mount new 
replace_squashfs () {
    [ -f ${SQFS_PORTAGE}.new ] || \
      { echo "No new portage tree version found!"; exit 1; }

    mountpoint -q ${PORTAGE}
    if [ $? -eq 0 ]; then
        umount ${PORTAGE} && echo "Unmounted ${PORTAGE}."
        if [ $? -ne 0 ]; then
            echo "Could not unmount ${PORTAGE} !"
            echo "New portage snapshot is at ${SQFS_PORTAGE}.new"
            exit 1
        fi
    fi

    if [ -f ${SQFS_PORTAGE} ]; then
        mv ${SQFS_PORTAGE} ${SQFS_PORTAGE}.previous
    else
        echo "No current squashFS backing file ${SQFS_PORTAGE} found,\
	assuming initial setup."
    fi
       
    mv ${SQFS_PORTAGE}.new ${SQFS_PORTAGE} && \
      mount ${PORTAGE} && echo "Mounted new snapshot at ${PORTAGE}."
}

# Create new squashfs image
create_squashfs () {
    echo 'Creating new SquashFS snapshot ...'
    mksquashfs ${PORTAGE} ${SQFS_PORTAGE}.new -comp xz -noappend \
      -no-progress 1>/dev/null && echo "SquashFS snapshot created at ${SQFS_PORTAGE}.new"
}

# Any custom changes to the portage tree 
customize () {
    echo "Applying local customizations ..."

    # Linphone
    perl -i -p -e 's/^(net-voip\/linphone|net-libs\/libeXosip|net-libs\/libosip)/# disabled by update_portage.sh - $1/;' ${PORTAGE}/profiles/package.mask
}

cleanup () {
    # In case still mounted
    umount_overlay

    # Remove potential left overs from mksquashfs
    rm -f ${SQFS_PORTAGE}.new

    # Make sure we have a working portage tree mounted
    mountpoint -q ${PORTAGE} || mount ${PORTAGE} 

    exit 1
}

while getopts "p:s:" OPTIONS; do
   case $OPTIONS in
       p) PORTAGE=$OPTARG;;
       s) SQFS_PORTAGE=$OPTARG;;
       ?) usage;;
   esac
done

[ -d ${PORTAGE} ] || { echo "${PORTAGE} is not a directory!"; usage; }

# make sure we clean up and have a working portage tree if interupted
trap "cleanup" INT TERM 

mount_overlay

# End early if there are no upstream changes
# assume if rsync is run only once that no upstream changes available
echo 'Syncing gentoo portage tree ...'
RUNS=$(emaint sync -r gentoo 2>/dev/null | grep -c 'Number of files')
[ $RUNS -eq 1 ] && { echo 'No upstream changes. Exiting.'; cleanup; }

# Optional step to customize the tree, mostly to alter upstream use masks
customize

create_squashfs
umount_overlay

replace_squashfs
