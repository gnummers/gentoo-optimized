# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=86394794e5ba538a5359c1a5d896ed47a464f804

inherit elisp

IUSE=""

DESCRIPTION="Emacs major mode for elm"
HOMEPAGE="https://github.com/jcollard/elm-mode"
SRC_URI="https://github.com/jcollard/elm-mode/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${COMMIT}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="README.md"

DEPEND="app-emacs/f app-emacs/let-alist app-emacs/s app-emacs/reformatter"
RDEPEND=${DEPEND}
