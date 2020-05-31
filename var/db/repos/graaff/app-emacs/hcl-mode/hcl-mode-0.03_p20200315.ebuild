# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

COMMIT=c3d1158ad1a64f06aa8986ab1cdea6b7fbdd4bf7

inherit elisp

IUSE=""

DESCRIPTION="Major mode of HCL (Hashicorp Configuration Language)"
HOMEPAGE="https://github.com/purcell/emacs-hcl-mode"
SRC_URI="https://github.com/purcell/emacs-hcl-mode/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/emacs-${PN}-${COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

DOCS="Changes README.md"

# Uses unpackaged cask
RESTRICT="test"
