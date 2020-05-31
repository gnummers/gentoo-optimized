# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI="5"
PYTHON_COMPAT=( python2_7 )

inherit git-r3
inherit distutils-r1
inherit python-r1

DESCRIPTION="GUI for PNG and JPEG optimization via optipng, pngcrush, advpng and jpegoptim"
HOMEPAGE="http://trimage.org/"

#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
EGIT_REPO_URI="https://github.com/Kilian/Trimage.git"
EGIT_COMMIT="e460faca7635f52d7e530b80835a847778e7eeac"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

# dependencies specified on homepage are outdated (no longer in portage at the time of
# writing) but slightly newer ones shouldn't be a problem.
#
# Original requirements for 1.0.5:
#   python 2.6
#   python-qt4 4.4
#   optipng 0.6.2.1
#   pngcrush 1.6.7
#   advancecomp 1.15
#   jpegoptim 1.2.2
#
DEPEND="
	>=dev-python/PyQt4-4.4
	<dev-python/PyQt4-4.12
	
	>=media-gfx/optipng-0.6.2.1
	<media-gfx/optipng-0.8
	
	>=media-gfx/pngcrush-1.6.7
	<media-gfx/pngcrush-1.8
	
	~app-arch/advancecomp-1.15[png]
	
	>=media-gfx/jpegoptim-1.2.2
	<media-gfx/jpegoptim-1.4
"

# PyQt4 needs to be emerged with X to build PyQt4.QtCore
RDEPEND="
	${DEPEND}
	dev-python/PyQt4[X]
"
