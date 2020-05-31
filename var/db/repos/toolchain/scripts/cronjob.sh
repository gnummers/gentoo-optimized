#!/bin/bash

# Make sure we only have one instance running at a time.
[[ ${FLOCKER} != $0 ]] && exec env FLOCKER=$0 flock -en $0 -c "$0 $*" || :
NCPUS=$(getconf _NPROCESSORS_ONLN)

set -e
cd "${0%/*}"/..

commit() {
	if [[ -n $(git status --porcelain) ]] ; then
		git add .
		git commit -m "$1" .
	fi
}

doit() {
	./scripts/update-$1
	cd sys-devel/$1
	commit "$1: update snapshots"
	cd ../..
}

main() {
	(
	git reset --hard origin/master
	git checkout -f
	git pull
	doit gcc
	doit gdb

	egencache --repo=toolchain --update --portdir-overlay="${PWD}" -j ${NCPUS:-1}
	cd metadata
	commit "cache: regen"

	# Just in case someone else made a commit before we did.
	git pull --rebase

	git push
	) >& scripts/cronjob.log
}
main "$@"
