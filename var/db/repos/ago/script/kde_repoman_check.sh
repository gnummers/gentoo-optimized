#!/bin/bash

MY_PORTDIR="$( portageq envvar PORTDIR )"

for k in kde-base kde-misc
do
	for i in $( ls "${MY_PORTDIR}"/"${k}"/ | grep -v "metadata\.xml" )
	do
		cd "${MY_PORTDIR}"/${k}/"${i}"
		result="$( repoman full > /dev/null 2>&1 )"
		if [ "${?}" = "1" ]
		then
			echo "The package "${k}"/"${i}" has the following problem:"
			repoman full
		fi
	done
done

exit 0
