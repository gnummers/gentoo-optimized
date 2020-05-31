EAPI="5"
inherit cmake-utils

DESCRIPTION="Template library to build a more complex storage schema with leveldb as a backend"
HOMEPAGE="https://github.com/ony/leveldb-tl"
AUTHOR="Nikolay Orliuk <virkony@gmail.com>"
SLOT="0"

KEYWORDS="amd64"
LICENSE="Apache-2.0"
DEPEND="dev-libs/leveldb dev-cpp/gtest"

SRC_URI="https://github.com/ony/${PN}/archive/gcc-4.7/v${PV}.zip -> ${P}.zip"
KEYWORDS="amd64"

S="${WORKDIR}/${PN}-gcc-4.7-v${PV}"
