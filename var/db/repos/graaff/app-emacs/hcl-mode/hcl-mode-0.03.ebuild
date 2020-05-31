# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit elisp

IUSE=""

DESCRIPTION="Major mode of HCL (Hashicorp Configuration Language)"
HOMEPAGE="https://github.com/syohex/emacs-hcl-mode"
SRC_URI="https://github.com/syohex/emacs-hcl-mode/archive/${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/emacs-${P}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

SITEFILE="50${PN}-gentoo.el"

# Uses unpackaged cask
RESTRICT="test"
