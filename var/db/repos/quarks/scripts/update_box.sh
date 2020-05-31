#!/bin/sh
#set -x
set -e

TODO=$(emerge -q --update --deep --newuse --pretend --with-bdeps=y world)
[ "${TODO}x" == "x" ] && { echo "Nothing to merge."; exit 0; }

# parallel jobs to speed up configure runs etc.
# but only half as many if CPU cores > 4
CPUS=$(nproc)
[ $CPUS -ge 4 ] && JOBS="--jobs $((CPUS/2))"
emerge --ask --update --deep --newuse --keep-going --accept-properties=-interactive --fail-clean --with-bdeps=y ${JOBS} world 

echo "Going to remove unneeded packages ..."
emerge --depclean

if [ -x $(which localepurge) ]; then
	echo "Removing unneeded locales..."
	localepurge
fi

echo "Fixing dependencies..."
revdep-rebuild -i

echo "Updating eix cache..."
eix-update -q

echo "Cleaning up archives.."
eclean -q -d packages
eclean -q -d distfiles
