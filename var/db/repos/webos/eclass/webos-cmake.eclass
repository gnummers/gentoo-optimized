# Copyright 2014 Maksym Sditanov <feniksa@rambler.ru>
# Distributed under the terms of the Apache 2 License
# $Header: $

# ELASS: webos.eclass
# @MAINTAINER:
# Maksym Sditanov
# @BLURB: Eclass for writting ebuilds for webos
# @DESCRIPTION:
# This eclass is ment to easy writting ebuilds for webos. It setup some predevined env variables

inherit cmake-utils

EXPORT_FUNCTIONS src_configure

webos-cmake_src_configure() {
	mycmakeargs+=(
		-DCMAKE_INSTALL_PREFIX:PATH="/"
		-DWEBOS_INSTALL_ROOT:PATH="/"
	)
	cmake-utils_src_configure
}

DEPEND+="dev-util/cmake-modules-webos"
