#!/bin/bash

OLD_DIR="${1}"
NEW_DIR="${2}"

if [[ -z "${OLD_DIR}" ]] || [[ -z "${NEW_DIR}" ]]; then
	echo "Usage: <old_dir> <new_dir>"
	exit 1
fi

if [ ! -d "${OLD_DIR}" ] ; then
	echo "ERROR: old_dir does not exist or is not directory!"
	exit 1
fi

if [ ! -d "${NEW_DIR}" ] ; then
	echo "ERROR: new_dir does not exist or is not directory!"
	exit 1
fi

pushd "${NEW_DIR}" >> /dev/null

for file in `ls */external/binaries-list`; do
	RESULT=`diff "${OLD_DIR}"/$file $file`

	if [ -n "${RESULT}" ] ; then
		echo "${file}"
		diff "${OLD_DIR}"/$file $file
	fi
done

popd >> /dev/null

echo "DONE."
