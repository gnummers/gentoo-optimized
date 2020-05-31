EAPI="6"

inherit cmake-utils git-r3

DESCRIPTION="clang-tags is a C / C++ source code indexing tool. Unlike many other indexing tools"
HOMEPAGE="http://ffevotte.github.io/clang-tags/"

if [[ ${PV} = 9999 ]]; then
	EGIT_REPO_URI="https://github.com/ffevotte/clang-tags.git"
	KEYWORDS="-* ~amd64 ~x86"
else
	SRC_URI="https://github.com/ffevotte/clang-tags/archive/v${PV}.tar.gz"
	KEYWORDS="~amd64 ~x86"
fi

SLOT="0"

LICENSE="GPL-2"


DEPEND="sys-devel/clang:5		
		dev-libs/jsoncpp
		dev-libs/boost
		dev-db/sqlite
		"
RDEPEND="dev-lang/python:2.7"

src_configure() {
        local mycmakeargs=(
                -DCMAKE_PREFIX_PATH="/usr/lib64/llvm/5"
        )
        cmake-utils_src_configure
}
