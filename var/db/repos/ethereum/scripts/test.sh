#!/usr/bin/env bash
#
# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2
#
# Build everything in a clean Gentoo environment
#
# Rafael Lorandi <coolparadox@gmail.com>
#

set -e -u -o pipefail
set -x

# Run with no arguments for an interative shell
# Run with '.' to test all packages
PACKAGE_REGEXP=''
test $# -eq 0 || PACKAGE_REGEXP=$1

TI_OPT='-ti'
CMD_OPT=''
test -z "$PACKAGE_REGEXP" || {
    TI_OPT=''
    CMD_OPT="/root/container_test.sh $PACKAGE_REGEXP"
}

WHEREAMI=$( dirname "$0" )
cd $WHEREAMI

HOST_EROOT=$( portageq envvar EROOT )
HOST_PORTAGE_DIR=$( portageq get_repo_path "$HOST_EROOT" gentoo )
HOST_DISTDIR=$( portageq distdir )
CACHE_PKGDIR=/var/cache/gentoo-ethereum-test/binpkgs
CACHE_CCACHEDIR=/var/cache/gentoo-ethereum-test/ccache

docker build --tag gentoo-ethereum-test .
docker run --rm $TI_OPT \
    --mount="type=bind,source=${HOST_PORTAGE_DIR},destination=/var/db/repos/gentoo" \
    --mount="type=bind,source=${HOST_DISTDIR},destination=/var/cache/distfiles" \
    --mount="type=bind,source=${CACHE_PKGDIR},destination=/var/cache/binpkgs" \
    --mount="type=bind,source=${CACHE_CCACHEDIR},destination=/var/cache/ccache" \
    gentoo-ethereum-test \
    /bin/bash -l $CMD_OPT

