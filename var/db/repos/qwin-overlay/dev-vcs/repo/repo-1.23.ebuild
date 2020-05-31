EAPI=4

DESCRIPTION="The Multiple Git Repository Tool from the Android Open Source Project"
HOMEPAGE="http://source.android.com/source/git-repo.html"
SRC_URI="https://storage.googleapis.com/git-repo-downloads/repo -> ${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~sh ~sparc ~x86 ~amd64-linux ~x86-linux"
S="${WORKDIR}"

RDEPEND="
	dev-vcs/git
"

src_install() {
	cp /usr/portage/distfiles/${PN} ${S}
	dobin ${PN}
}
