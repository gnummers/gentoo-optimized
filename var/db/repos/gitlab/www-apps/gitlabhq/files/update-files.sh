#!/bin/bash
from=$1
to=$2

if [[ -z "$from" || -z "$to" ]] ; then
	echo "Usage: $(basename $0) <from-version> <to-version>"
	echo "Example: $(basename $0) 11.6 11.7"
	exit 1
fi

from_escaped=$(echo $from | sed 's/\./\\./g')

set -e
for i in gitlabhq-${from}* ; do cp -v $i $(echo $i | sed "s/${from_escaped}/${to}/g") ; done
for i in gitlabhq-${to}* ; do sed "s/${from_escaped}/${to}/g" -i $i  ; done
