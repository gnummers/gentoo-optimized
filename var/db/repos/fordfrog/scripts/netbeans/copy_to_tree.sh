#!/bin/bash

ROOT=$(dirname $(dirname $(dirname $(readlink -f ${0}))))
TREE=${1}
VERSION=${2}
MESSAGE=${3}

if [ -z "${TREE}" -o -z "${VERSION}" -o -z "${MESSAGE}" ]; then
	echo "Usage: ${0} <tree> <version> <message>"
	exit 1
fi

pushd ${ROOT} &> /dev/null

for file in */*/*${VERSION}*.ebuild; do
	cp ${file} ${TREE}${file}
	pushd ${TREE}$(dirname ${file}) &> /dev/null
	cvs add $(basename ${file})
	echangelog "${MESSAGE}"
	ebuild $(basename ${file}) manifest
	popd &> /dev/null
done

popd &> /dev/null
