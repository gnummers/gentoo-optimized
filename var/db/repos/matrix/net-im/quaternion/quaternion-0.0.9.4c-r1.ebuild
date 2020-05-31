# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="An IM client for the Matrix protocol"
HOMEPAGE="https://github.com/qmatrixclient/quaternion"

inherit eutils cmake-utils

if [[ ${PV} == "9999" ]]; then
	inherit git-r3

	SRC_URI=""
	EGIT_REPO_URI="https://github.com/quotient-im/${PN}.git"
	EGIT_SUBMODULES=()
else
	SRC_URI="https://github.com/quotient-im/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="~amd64 ~x86"

	S=${WORKDIR}/${P^}
fi

LICENSE="GPL-3"
SLOT="0"

DEPEND=">=dev-qt/qtgui-5.6.2
		>=dev-qt/qtdeclarative-5.6.2
		dev-qt/qtquickcontrols
		dev-qt/qtquickcontrols2
		dev-qt/qtmultimedia
		dev-libs/qtkeychain
		dev-libs/libQuotient"
RDEPEND="${DEPEND}"
