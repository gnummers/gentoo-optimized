#!/bin/bash

#
# Langpack generator for mozilla packages
# hacked together by Ian Stakenvicius <axs@gentoo.org>, spring 2016
#
# Call this script, providing a path to the ebuild you want to generate the langpacks for as argument1
#

# source make.conf to get PORTAGE_TMPDIR etc.
if [[ -e /etc/make.conf ]]; then
	. /etc/make.conf
elif [[ -e /etc/portage/make.conf ]]; then
	. /etc/portage/make.conf
fi

: ${L10N_STAGING_DIR:=/var/cache/mozl10n}
: ${LANGPACK_DESTDIR:=${L10N_STAGING_DIR}}
: ${PORTAGE_TMPDIR:=/var/tmp/portage}
: ${PORTDIR:=/usr/portage}

ebuild=${1}

if ! hg --version &>/dev/null; then
	echo "$0 needs mercurial -- aborting"
	exit 1
fi

if [[ ${ebuild/.ebuild/} == ${ebuild} ]] || [[ ! -e ${ebuild} ]]; then
  echo "Must specify the full path to the ebuild as arg.1"
fi

if ! grep mozlinguas_mozconfig ${ebuild} &>/dev/null ; then
  if ! grep mozlinguas_mozconfig ${ebuild%/*}/../../eclass/$(grep -o 'mozconfig-v[^ ]*' ${ebuild}).eclass &>/dev/null ; then
    if ! grep mozlinguas_mozconfig ${PORTDIR}/eclass/$(grep -o 'mozconfig-v[^ ]*' ${ebuild}).eclass &>/dev/null ; then
      echo ""
      echo "WARNING -- this script will not work unless 'mozlinguas_mozconfig' is called sometime during"
      echo "src_configure between mozconfig_init and mozconfig_final.  A rough check did not find this call."
      echo "Press any key to continue or CTRL-C to abort."
      read target
    fi
  fi
fi

echo ""
echo "Using ${L10N_STAGING_DIR} for l10n repository cache"
echo "Using ${LANGPACK_DESTDIR} to store generated langpacks"
echo ""

target=${ebuild##*/}
target=${target%.ebuild}
uctarget=${target^^*}
uctarget=${uctarget//-/_}

l10nrepo="mozilla-release"
if [[ ${uctarget/_BETA/} != ${uctarget} ]]; then
  l10nrepo="mozilla-beta"
  uctarget=${uctarget/_BETA/b}
fi
uctarget=${uctarget%_PRE*}

l10n_releasedir="${LANGPACK_DESTDIR%/}/l10n-${target}"

# if the mozlangs.cached file in l10n_releasedir doesn't exist, then
# create it and checkout all the upstream l10n repositories using mercurial,
# based on the list of locales in MOZ_LANGS in the ebuild.  If the directory
# already exists, then assume everything has been checked out and
# proceed.
if ! [[ -e ${l10n_releasedir}/mozlangs.cached ]]; then
  mkdir -p ${l10n_releasedir}

  # source the ebuild so that MOZ_LANGS is available
  cat ${ebuild} |grep -A 5 'MOZ_LANGS' >${l10n_releasedir}/mozlangs
  . ${l10n_releasedir}/mozlangs

  for abcd in "${MOZ_LANGS[@]}" ; do
    if [[ ! -d ${L10N_STAGING_DIR%/}/${l10nrepo}/${abcd} ]]; then
      mkdir -p ${L10N_STAGING_DIR%/}/${l10nrepo}
      pushd ${L10N_STAGING_DIR%/}/${l10nrepo} &>/dev/null || die
      hg clone "http://hg.mozilla.org/releases/l10n/${l10nrepo}/${abcd}"
      popd &>/dev/null || die
    fi
    if [[ -d ${L10N_STAGING_DIR%/}/${l10nrepo}/${abcd} ]]; then
      pushd ${L10N_STAGING_DIR%/}/${l10nrepo}/${abcd} &>/dev/null || die
      hg pull
      if hg tags |grep ${uctarget//\./_}_RELEASE &>/dev/null; then
        rev="-r ${uctarget//\./_}_RELEASE"
      elif hg branches |grep ${uctarget//\./} &>/dev/null; then
        rev="-r $(hg branches |grep ${uctarget//\./})"
      else
        echo "*** WARNING: ${abcd} has no branch or tag matching ${target}, using HEAD"
        rev=
      fi
      hg archive ${rev} -t files ${l10n_releasedir}/src/${abcd}
      popd &>/dev/null || die
    fi
  done
  cp ${l10n_releasedir}/mozlangs{,.cached}
else
  . ${l10n_releasedir}/mozlangs.cached
fi

# set some variables based on what package it is
# so the langpacks can be rolled
# note -- this sets $S to BUILD_OBJ_DIR, getting the path
# from the actual ebuild would likely be more stable long-term
case "${target}" in
*thunderbird*)
	category=mail-client
	langpack_targets=( langpack calendar-langpack )
	locale_buildpath=mail/locales
	if grep 'S=.*comm-esr' ${ebuild} &>/dev/null; then
		S=${PORTAGE_TMPDIR%/}/${category}/${target}/work/comm-esr*/tbird
	else
		S=${PORTAGE_TMPDIR%/}/${category}/${target}/work/thunderbird-*/tbird
	fi
	;;
*firefox*)
	category=www-client
	langpack_targets=( langpack )
	locale_buildpath=browser/locales
	if grep 'S=.*mozilla-esr' ${ebuild} &>/dev/null; then
		S=${PORTAGE_TMPDIR%/}/${category}/${target}/work/mozilla-esr*/ff
	else
		S=${PORTAGE_TMPDIR%/}/${category}/${target}/work/firefox-*/ff
	fi
	;;
*seamonkey*)
	category=www-client
	langpack_targets=( langpack )
	locale_buildpath=suite/locales
	if grep 'S=.*comm-release' ${ebuild} &>/dev/null; then
		S=${PORTAGE_TMPDIR%/}/${category}/${target}/work/comm-release*/seamonk
	else
		S=${PORTAGE_TMPDIR%/}/${category}/${target}/work/seamonkey-*/seamonk
	fi
	;;
esac


# compile a build, with the necessary flags to set up the use of the checked out langpacks
MOZ_GENERATE_LANGPACKS=1 MOZ_L10N_SOURCEDIR="${l10n_releasedir}/src" ebuild ${ebuild} clean compile

if ! [[ -d ${S} ]]; then
	die "Need a fully compiled package before langpack generation can be performed"
fi


function package_lightning {
  pushd ${S}/dist/xpi-stage &>/dev/null || die
  cp -rL lightning stage-lightning
  for ech in lightning-*; do
    if [[ -d $ech ]]; then
      abcd=${ech/lightning-/}
      if [[ -d ${ech}/chrome/calendar-${abcd} ]]; then
        cp -t stage-lightning/chrome -rL ${ech}/chrome/{calendar,lightning}-${abcd}
        grep '^locale ' ${ech}/chrome.manifest |tee -a stage-lightning/chrome.manifest
      else
        echo "${abcd} does not have any locale files"
      fi
    fi
  done
  cd stage-lightning
  find . -type f -name .mkdir.done -delete
  vers=$(cat install.rdf |grep 'em:version' |sed -e 's#^.*>\([0-9\.]*\)<.*$#\1#')

  # roll a .xpi that mimicks what upstream would roll if they ever did it again
  zip -9 -r ${l10n_releasedir}/lightning-${vers}.xpi *

  # make a tarball, as it may be more suitable to extract that instead of using a
  # faked upstream package
  cd ..
  mv stage-lightning lightning-${vers}
  tar -Jcf ${l10n_releasedir}/lightning-${vers}.tar.xz lightning-${vers}
  popd &>/dev/null || die
}

function package_gdata_provider {
  pushd ${S}/dist/xpi-stage &>/dev/null || die
  cp -rL gdata-provider stage-gdata-provider
  for ech in gdata-provider-*; do
    if [[ -d $ech ]]; then
      abcd=${ech/gdata-provider-/}
      if [[ -d ${ech}/chrome/gdata-provider-${abcd} ]]; then
        cp -t stage-gdata-provider/chrome -rL ${ech}/chrome/gdata-provider-${abcd}
        grep '^locale ' ${ech}/chrome.manifest |tee -a stage-gdata-provider/chrome.manifest
      else
        echo "${abcd} does not have any locale files"
      fi
    fi
  done
  cd stage-gdata-provider
  find . -type f -name .mkdir.done -delete
  vers=$(cat install.rdf |grep 'em:version' |sed -e 's#^.*>\([0-9\.]*\)<.*$#\1#')

  # roll a .xpi that mimicks what upstream would roll if they ever did it again
  zip -9 -r ${l10n_releasedir}/gdata-provider-${vers}.xpi *

  # make a tarball, as it may be more suitable to extract that instead of using a
  # faked upstream package
  cd ..
  mv stage-gdata-provider gdata-provider-${vers}
  tar -Jcf ${l10n_releasedir}/gdata-provider-${vers}.tar.xz gdata-provider-${vers}
  popd &>/dev/null || die
}

# run the locales
for langpack_op in "${langpack_targets[@]}"; do
  cd ${S}/${locale_buildpath}
  for ech_l10n in ${l10n_releasedir}/src/* ; do
    if [[ -d ${ech_l10n} ]]; then
      abcd=${ech_l10n##*/}
      # Need to set LOCALE_MERGEDIR to someplace that doesnt exist -- odd but whatever
      make ${langpack_op}-${abcd} LOCALE_MERGEDIR=./${abcd}
    fi
  done

  # package lightning and gdata-provider if calendar was a target
  if ! [[ ${langpack_op/calendar/} == ${langpack_op} ]]; then
    package_lightning
    package_gdata_provider
  fi

done

# get the langpacks
cp -t ${l10n_releasedir}/ ${S}/dist/linux-*/xpi/*lang*

