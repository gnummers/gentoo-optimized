#!/bin/bash
# vim: sts=4 sw=4 et tw=0 :
#
# Bumps Firefox and Xulrunner alpha/beta snapshots.
# Needs an existing alpha/beta snapshot ebuild to work

# Die if a command fails
set -e

# Config
MOZHG="http://hg.mozilla.org"
MOZBRANCH="mozilla-central"
DISTDIR=$(python -c "import portage; print portage.settings['DISTDIR']")
MOZOVERLAY=$(dirname $0)/..
PACKAGE="firefox" # Only handles firefox

next_tag_version() {
    product=$(tr '[:lower:]' '[:upper:]' <<<$1)
    version=$(tr '.-' '_' <<<$2)
    # Get the latest tag in ${MOZBRANCH}
    tag=$(wget -q -O - ${MOZHG}/${MOZBRANCH}/tags | grep -o "${product}_${version}[ab][0-9]\+_RELEASE" | sort -rV | line)
    tag=($(sed -e "s/${product}_${version}\([ab]\)\([0-9]\+\)_RELEASE/\1 \2/"<<<$tag))
    tag=${tag[0]/a/_alpha}
    tag=${tag[0]/b/_beta}
    echo ${tag[0]}$((${tag[1]}+1))
}

new_versions() {
    # Try to get 3.7_alpha6_preN-rM -> 3.7_alpha6 N M
    v=($(sed -e "s/${1}-\(.*\)_pre\([0-9]\+\)-r\([0-9]\+\).ebuild/\1 \2 \3/" <<<$2))
    # Try to get 3.7_alpha6_preN    -> 3.7_alpha6 N 0
    test "${#v[@]}" != 3 && v=($(sed -e "s/${1}-\(.*\)_pre\([0-9]\+\).ebuild/\1 \2 0/" <<<$2))
    # Try to get 3.7_alpha6-rM      -> 3.7_alpha6 0 M
    test "${#v[@]}" != 3 && v=($(sed -e "s/${1}-\(.*\)-r\([0-9]\+\).ebuild/\1 0 \2/" <<<$2))
    # Try to get 3.7_alpha6         -> 3.7_alpha6 0 0
    test "${#v[@]}" != 3 && v=($(sed -e "s/${1}-\(.*\).ebuild/\1 0 0/" <<<$2))
    # FAIL
    test "${#v[@]}" != 3 && echo "Failed to parse version of $2" 1>&2 && exit 1
    # If not already set, set the firefox version (for the branch tags)
    test -z "${FF_PV}" && FF_PV=${v[0]/_*/}
    # Get the next ${PACKAGE} tag version to get the alphaN_pre/betaN_pre number
    tag_level=$(next_tag_version ${PACKAGE} "${FF_PV}")
    # If the current ebuild is on the same tag-level as the new ebuild
    if test "${tag_level}" = "_${v[0]/*_/}"; then
        # Use the next _pre number
        echo ${v[0]} $((${v[1]}+1)) ${v[2]}
    else
        # Reset the _pre number
        echo ${v[0]} 1 0
    fi
}

old() {
    echo *.ebuild | tr '[:space:]' '\n' | sort -rV | line
}

# first, firefox
CAT=www-client
PN=mozilla-firefox
CHANGESET=$(wget -qO - ${MOZHG}/${MOZBRANCH}/summary | grep tip.tar.bz2 | sed -e "s:.*href=\"/${MOZBRANCH}/file/\([^\"]*\)\">files.*:\1:")
cd "${MOZOVERLAY}/${CAT}/${PN}"
old_ebuild=$(old)
nv=($(new_versions ${PN} ${old_ebuild}))
FF_PV=${nv[0]/_*/}
new_ebuild="${PN}-${nv[0]}_pre${nv[1]}.ebuild"
tarball_v="${nv[0]/_alpha/a}"
tarball_v="${tarball_v/_beta/b}"
tarball_v="${tarball_v}_pre${nv[1]}"
tarball="${PACKAGE}-${tarball_v}_${CHANGESET}.source.tar.bz2"

cp "${old_ebuild}" "${new_ebuild}"
sed -e "s/CHANGESET=.*/CHANGESET=\"${CHANGESET}\"/g" -i "${new_ebuild}"
wget "${MOZHG}/${MOZBRANCH}/archive/${CHANGESET}.tar.bz2" -O "${DISTDIR}/${tarball}"
scp "${DISTDIR}/${tarball}" dev.gentoo.org:~/public_html/mozilla/dist/
rm -v "${DISTDIR}/${tarball}" # comment this to save bandwidth
repoman manifest

# now, xulrunner
CAT=net-libs
PN=xulrunner
cd "../../${CAT}/${PN}"
old_ebuild=$(old)
nv=($(new_versions ${PN} ${old_ebuild}))
new_ebuild="${PN}-${nv[0]}_pre${nv[1]}.ebuild"

cp "${old_ebuild}" "${new_ebuild}"
sed -e "s/CHANGESET=.*/CHANGESET=\"${CHANGESET}\"/g" -i "${new_ebuild}"
repoman manifest
