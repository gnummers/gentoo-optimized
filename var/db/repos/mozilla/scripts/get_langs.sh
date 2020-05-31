#!/bin/bash
# vim: set sts=2 sw=2 et tw=0 :

if test -z "${2}"; then
	echo "Usage: ${0} <product> <version>"
	exit 1
fi

INBUILT_LANGS="en en-US"
PRODUCT="${1}"
VER="${2}"
MOZ_URI="http://archive.mozilla.org/pub/mozilla.org/${PRODUCT}/releases/${VER}"
if [[ "${PRODUCT}" =~ (firefox|thunderbird|icecat) ]]; then
  if [[ "${PRODUCT}" =~ icecat ]]; then
    LANG_URI="http://gnuzilla.gnu.org/download/langpacks/${VER}"
  else
    LANG_URI="${MOZ_URI}/linux-i686/xpi/"
  fi
  XPI_LANGS=$(wget -q "${LANG_URI}" -O - | grep -o '[a-zA-Z.-]\+\.xpi' | sed 's/\.xpi//')
elif [[ "${PRODUCT}" =~ seamonkey ]]; then
  LANG_URI="${MOZ_URI}/langpack/"
  XPI_LANGS=$(wget -q "${LANG_URI}" -O - | grep -o '[a-zA-Z.-]\+\.xpi' | sed 's/\.\(.*\)\.langpack\.xpi/\1/')
else
  echo 'Unknown product, dying...'
  exit 1
fi
LANGS=$(echo ${INBUILT_LANGS} ${XPI_LANGS} | tr " " "\n" | sort -d | uniq | tr "\n" " ")
echo "MOZ_LANGS=(${LANGS})"
