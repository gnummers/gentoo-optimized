EAPI="5"
inherit cmake-utils

DESCRIPTION="Template library to build complex storage schema with leveldb as a backend"
HOMEPAGE="https://github.com/ony/leveldb-tl"
AUTHOR="Nikolay Orliuk <virkony@gmail.com>"
SLOT="0"

KEYWORDS="amd64"
LICENSE="Apache-2.0"
DEPEND="dev-libs/leveldb"

if [[ ${PV} = *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="git://github.com/ony/leveldb-tl.git"
	EGIT_BRANCH="gcc-4.7"
#else
#	SRC_URI="https://github.com/feniksa/${PN}/archive/submissions/${PV}.zip -> ${P}.zip"
#    KEYWORDS="amd64"
#	S="${WORKDIR}/${PN}-submissions-${PV}"
fi
