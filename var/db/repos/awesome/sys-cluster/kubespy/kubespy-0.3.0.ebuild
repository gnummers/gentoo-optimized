
EAPI=6
inherit golang-vcs-snapshot golang-build

EGO_PN="github.com/pulumi/kubespy/..."
EGIT_COMMIT="v${PV}"
DESCRIPTION="Tools for observing Kubernetes resources in real time"
HOMEPAGE="https://github.com/pulumi/kubespy"
ARCHIVE_URI="https://${EGO_PN%/*}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
SRC_URI="${ARCHIVE_URI}"
LICENSE=""
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND="dev-lang/go
		>=dev-go/dep-0.5.0"
RDEPEND="${DEPEND}"

src_prepare() {
	cd src/github.com/pulumi/kubespy
	einfo "Running dep ensure..."
	GOPATH=${S} dep ensure
	default
}

src_install() {
	GOPATH=${S} go install github.com/pulumi/kubespy/cmd/kubespy
	dobin bin/kubespy
}
