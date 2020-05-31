#!/bin/bash
DIR=${1}
MESSAGE=${2}

if [[ -z "${DIR}" ]] || [[ -z "${MESSAGE}" ]] ; then
	echo "Usage: <repo_root_directory> <message>"
	exit 1
fi

pushd "${1}" >/dev/null || exit 1
for dir in dev-*/netbeans*; do
	pushd "${dir}"
	echangelog "${MESSAGE}"
	ebuild `ls *.ebuild | tail -n1` digest
	popd
done
popd >/dev/null || exit 1

echo "DONE!"
