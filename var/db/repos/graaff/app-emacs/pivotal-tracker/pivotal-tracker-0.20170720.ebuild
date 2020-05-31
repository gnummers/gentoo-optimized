# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

COMMIT=0311d117037c74512149a4a78b269c2e46d7dfba

inherit elisp

DESCRIPTION="Emacs client for Pivotal Tracker"
HOMEPAGE="https://github.com/jxa/pivotal-tracker"
SRC_URI="https://github.com/jxa/pivotal-tracker/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"

DOCS="README.md"
SITEFILE="50${PN}-gentoo.el"
