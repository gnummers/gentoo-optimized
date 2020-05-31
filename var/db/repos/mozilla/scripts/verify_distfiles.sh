#!/bin/sh

# Script to check distfiles against SHA512SUMS in upstream repo
# Note - your gpg setup needs to have the mozilla release key imported for signature verification
# Author: Ian Stakenvicius
# 2016-03-10

check_distfiles() {
	local myver myname tmp
	myname=$(qatom $1 |awk '{print $2}')
        mybasename=${myname/-bin/}
	if grep -e 'MOZ_ESR=""' -e 'MOZ_ESR="0"' $1 &>/dev/null || [[ -n $(grep -L '^MOZ_ESR' $1) ]] ; then
		myver=$(qatom $1 |awk '{print $3}')
	else
		myver=$(qatom $1 |awk '{print $3 "esr"}')
	fi
	myver=${myver/_beta/b}

	sigfile=$(mktemp)
	wget -O ${sigfile}.asc -q https://archive.mozilla.org/pub/${mybasename}/releases/${myver}/SHA512SUMS.asc
	wget -O ${sigfile} -q https://archive.mozilla.org/pub/${mybasename}/releases/${myver}/SHA512SUMS
	gpg --verify ${sigfile}.asc ${sigfile} || exit 1

	grep -e "^DIST ${mybasename}-${myver}[-\.]" \
	  -e "^DIST ${myname}_.*-${myver}[-\.]" \
	  -e "^DIST ${myname}_.*-${myver/esr/}[-\.]" \
	  Manifest |grep -v -- "${myname}-.*-patches-" |awk '{print $7}' |while read ech ; do
		tmp=$(grep ${ech} Manifest |awk '{print $2}')
		if grep $ech ${sigfile} &>/dev/null ; then
			echo -n $tmp
			grep ${ech} ${sigfile} |awk '{print " -> " $2 " OK"}'
		else
			echo -n "ERROR - no file with sum ${ech} found -- ${tmp}"
			exit 1
		fi
	done
	rm -f ${sigfile}.asc ${sigfile}
}


if [[ ! -e Manifest ]]; then
	echo "ERROR - must be run in the directory of the package (with ebuilds and Manifest)"
	echo "USAGE: $0 [ebuild file(s)]"
	exit 1
fi

ebuild_list=( "$@" )
if [ "$#" -eq 0 ]; then
	echo "No arguments specified, verifying all ebuilds in current directory"
	ebuild_list=( *.ebuild )
fi

for ebuild in "${ebuild_list[@]}"; do
	echo "Checking $ebuild"
	if [[ -e $ebuild ]]; then
		check_distfiles $ebuild
	else
		echo "ERROR - $ebuild does not exist, skipping"
	fi
done
