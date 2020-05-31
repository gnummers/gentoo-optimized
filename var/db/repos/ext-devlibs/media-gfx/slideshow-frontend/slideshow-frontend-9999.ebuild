# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=(python2_{6,7})
DISTUTILS_SINGLE_IMPL="true"
inherit git-r3 distutils-r1

DESCRIPTION="Slideshow is a kiosk-style application for showing media in a loop."
HOMEPAGE="https://ext.github.io/slideshow/"

LICENSE="AGPL-3"
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND="dev-python/cherrypy
dev-python/genshi
dev-python/python-xlib
dev-python/htmlcolor"
RDEPEND="${DEPEND}"

EGIT_REPO_URI="https://github.com/ext/slideshow-frontend.git"
