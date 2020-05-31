# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit elisp git-r3

DESCRIPTION="Idris syntax highlighting and (eventually) other things for emacs"
HOMEPAGE="https://github.com/idris-hackers/idris-mode"
EGIT_REPO_URI="https://github.com/idris-hackers/idris-mode.git"
LICENSE="GPL-3"
IUSE=""

KEYWORDS=""
SLOT="0"

DEPEND=""
RDEPEND="app-emacs/haskell-mode"

SITEFILE="50${PN}-gentoo.el"

RESTRICT=test # fails frequently

src_prepare() {
	default
	cp "${FILESDIR}/${SITEFILE}" "${S}" \
		|| die "Could not cp ${SITEFILE}"
	sed -e 's@"--ideslave"@"--nocolour" "--ideslave"@' \
		-i "${S}/inferior-idris.el" \
		|| die "Could not set --nocolour in inferior-idris.el"
}
