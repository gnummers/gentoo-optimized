# ebuild from gentoo-overlay.megacoffee.net, author: dneuge
# Distributed under the terms of the GNU General Public License v2
# feel free to use, modify and upload somewhere else without naming

EAPI="6"
PYTHON_COMPAT=( python2_7 )

inherit distutils-r1
inherit git-r3

DESCRIPTION="Quicktime atom positioning in Python for fast streaming"
HOMEPAGE="https://github.com/danielgtaylor/qtfaststart"

EGIT_REPO_URI="https://github.com/danielgtaylor/qtfaststart.git"
EGIT_COMMIT="a2649843228fb49c3a6bd0335960f70c45752e78"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
