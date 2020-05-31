#!/bin/env bash

set -e -u -o pipefail

REPO_NAME='ethereum'
REPO_BRANCH='dev'

PATTERN="$1"

running_in_docker() {
  awk -F/ '$2 == "docker"' /proc/self/cgroup | read
}

running_in_docker
eselect news read --quiet

EMERGE_BIN='emerge --buildpkg --usepkg --binpkg-respect-use=y'
which git 2>/dev/null || {
    USE='-blksha1 -gpg -iconv -nls -pcre -pcre-jit -perl -threads -webdav' $EMERGE_BIN dev-vcs/git
}
emerge --sync $REPO_NAME
which equery 2>/dev/null || {
    $EMERGE_BIN app-portage/gentoolkit
}
test "$REPO_BRANCH" = 'master' || {
    EROOT=$( portageq envvar EROOT )
    REPO_PATH=$( portageq get_repo_path "$EROOT" "$REPO_NAME" )
    REPOS_DIR=$( dirname "$REPO_PATH" )
    REPO_URI=$( portageq repos_config "$EROOT" | sed -r -e "/\[${REPO_NAME}]/,/^$/"'!d' -e '/^sync-uri *=/!d' -e 's/.*= *//' )
    (
        cd "$REPOS_DIR"
        rm -rf "$REPO_NAME"
        git clone --branch "$REPO_BRANCH" "$REPO_URI" "$REPO_NAME"
    )
    emerge --sync $REPO_NAME
}

which ccache 2>/dev/null || {
    $EMERGE_BIN dev-util/ccache
}

atoms() {
    portageq --repo=$REPO_NAME pquery --no-filters | \
    while read EBUILD ; do
        echo "=${EBUILD}::${REPO_NAME}"
    done
}

atom_use() {
    local ATOM=$1
    equery -qCN uses $ATOM | \
    while read FLAG ; do
        FLAG=${FLAG#-}
        FLAG=${FLAG#+}
        echo -n " ${FLAG}"
    done | \
    sed 's/^ *//'
}

atom_keywords() {
    local ATOM=$1
    local EBUILD=$( equery which $ATOM )
    local KEYWORDS=$( sed -r \
        -e '/^KEYWORDS=/!d' \
        -e 's/^KEYWORDS="//' \
        -e 's/"$//' \
        "$EBUILD"
    )
    echo -n "$KEYWORDS"
}

rm -rf /etc/portage/package.{use,accept_keywords}
mkdir -p /etc/portage/package.{use,accept_keywords}
set -x
atoms | \
grep "$PATTERN" | \
while read ATOM ; do
    emerge --depclean
    USE=$( atom_use $ATOM )
    echo "$ATOM $USE" >/etc/portage/package.use/ethereum
    KEYWORDS=$( atom_keywords $ATOM )
    echo "$ATOM $KEYWORDS" >/etc/portage/package.accept_keywords/ethereum
    $EMERGE_BIN --onlydeps $ATOM
    FEATURES='test ccache' CCACHE_DIR="/var/cache/ccache" CCACHE_SIZE="5G" emerge $ATOM
    emerge --unmerge $ATOM
done

