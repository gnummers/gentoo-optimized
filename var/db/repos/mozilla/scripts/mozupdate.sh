#!/bin/bash

# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

# This script fetches mozilla sources from their hg repository and
# creates snapshot tarballs.

# Author:  Lars Wendler, <polynomial-c@gentoo.org>
# Co-author: Jory A. Pratt, <anarchy@gentoo.org>

# v1.0 - initial version

PROGNAME=$1

if [[ $# -ne 1 ]] ; then
	echo "Usage: ${0##*/} Please specify either firefox or thunderbird"
	exit 1
fi

case ${PROGNAME} in
	firefox)
		MILESTONE_TARGET="browser/config/version.txt"
		SOURCES_DIR="mozilla-central"
	;;
	thunderbird)
		MILESTONE_TARGET="mail/config/milestone.txt"
		SOURCES_DIR="comm-central"
	;;
	*)
		echo "Wrong application chosen. Please choose one of these:"
		echo
		echo "firefox"
		echo "thunderbird"
		exit 1
	;;
esac

fetch_repo() {
	if [ -d "${SOURCES_DIR}" ] ; then
		pushd ${SOURCES_DIR} &>/dev/null || return 5
		hg pull -u || return 6
		popd &>/dev/null
	else
		hg clone http://hg.mozilla.org/${SOURCES_DIR}/ ${SOURCES_DIR} \
			|| return 7
	fi
	return 0
}

get_changeset_data() {
	CHANGESET="$(hg log ${SOURCES_DIR} | head -n1 | awk -F : '{print $3}')"
	MILESTONE="$(tail -n1 ${SOURCES_DIR}/${MILESTONE_TARGET} | sed 's:pre:_pre:')"
	return 0
}

fetch_repo || exit $?
get_changeset_data

# create the tarball
tar --exclude-vcs -cjf  ${PROGNAME}-${MILESTONE}_${CHANGESET}.source.tar.bz2 \
	${SOURCES_DIR} || exit 3

exit 0
