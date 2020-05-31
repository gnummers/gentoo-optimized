#!/bin/bash
# Sync keywords with portdir where portdir is the target one.
# Author: Tomáš Chvátal <scarabeus@gentoo.org>
# Version: 0.1

# temfile where we output packages list
TMPPACKAGES="/tmp/$(basename $0).packages.$$.tmp"

###############################################################################
# get package names we have in overlay
###############################################################################
function get_packages() {
	local overlay=$1

	find "${overlay}" -name \*.ebuild | \
		sed -e "s:${overlay}::" | \
		awk -F/ '{print $1"/"$2}' | \
		sort | uniq > ${TMPPACKAGES}
}
###############################################################################
# get keywords for package | we always select latest version
###############################################################################
function get_keywords() {
	local package=$1
	local keywords

	# return false if package is not in portdir
	[[ -d "${PORTDIR}/${package}" ]] || return 1

	pushd "${PORTDIR}/${package}" > /dev/null
	# grep added to ignore live versions
	keywords=$(pquery --max ${package} --repo=${PORTDIR} | \
		awk -F/ '{print $2".ebuild"}' | \
		xargs sed -ne 's/^KEYWORDS="\(.*\)"/\1/p' | \
		tr '\n' ' ')
	popd > /dev/null

	echo ${keywords}
}
###############################################################################
# set keywords for all ebuilds in overlay for specified package
###############################################################################
function set_keywords() {
	local overlay=$1
	local package=$2

	# if keywords are not set then we return
	[[ "x${KEYWORDS}" == "x" ]] && return 1

	pushd "${overlay}/${package}" > /dev/null
	# first drop all keywords
	ekeyword ^all *.ebuild > /dev/null

	# then set our keywords set
	ekeyword ${KEYWORDS} *.ebuild > /dev/null
	ekeyword ~all *.ebuild > /dev/null
	popd > /dev/null

	echo "true"
}
###############################################################################
# regenerate manifest on specified package
###############################################################################
function regen_manifest() {
	local overlay=$1
	local package=$2

	pushd "${overlay}/${package}" > /dev/null
	repoman manifest > /dev/null
	popd > /dev/null
}
###############################################################################
# cleanup all temporary files
###############################################################################
function cleanup() {
	rm -rf ${TMPPACKAGES}
}
###############################################################################
# print out help function
###############################################################################
function help() {
	echo "Welcome to overlay KEYWORDS syncer"
	echo
	echo "!!!"
	echo "!!! THIS SCRIPT REQUIRES sys-apps/pkgcore !!!"
	echo "!!!"
	echo
	echo "For usage you just need to specify overlay you want to work."
	echo "Example:"
	echo "$0 -o /var/tmp/myoverlay/"
	echo
	echo "Optionally you can also specify location of portdir"
	echo "Example:"
	echo "$0 -p /var/tmp/portage/ -o /var/tmp/myoverlay/"
	exit 0
}
###############################################################################
# argument passing
###############################################################################
if [[ $1 == "--help" ]]; then
	help
fi
OVERLAY=
PORTDIR=$(portageq portdir)
while getopts o:p: arg ; do
	case ${arg} in
		o) OVERLAY="${OPTARG}" ;;
		p) PORTDIR="${OPTARG}" ;;
		*) help ;;
		?) help ;;
	esac
done
[[ -z "${OVERLAY}" ]] && help
###############################################################################
# main
###############################################################################
get_packages ${OVERLAY}
# loop throught all packages
cat ${TMPPACKAGES} | while read PACKAGE; do
	echo " >>> Working on: ${PACKAGE}"
	KEYWORDS=$(get_keywords ${PACKAGE})
	[[ "x$(set_keywords ${OVERLAY} ${PACKAGE})" == "x" ]] || \
		regen_manifest ${OVERLAY} ${PACKAGE}
done
cleanup
