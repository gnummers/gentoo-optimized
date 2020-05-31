# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/rancher/k3s"
EGIT_COMMIT="65d8764812ec2a2a2de4e593f0578411264f03f3"
EGO_VENDOR=(
	"github.com/Microsoft/go-winio v0.4.12"
	"github.com/alexflint/go-filemutex 72bdc8eae2ae"
	"github.com/bhendo/go-powershell 219e7fb4e41e"
	"github.com/buger/jsonparser bf1c66bbce23"
	"github.com/containerd/cgroups 4994991857f9"
	"github.com/containerd/console c12b1e7919c1"
	"github.com/containerd/continuity bd77b46c8352"
	"github.com/containerd/fifo 3d5202aec260"
	"github.com/containerd/go-cni 40bcf8ec8acd"
	"github.com/containerd/go-runc 5a6d9f37cfa3"
	"github.com/containerd/ttrpc f82148331ad2"
	"github.com/coreos/go-iptables v0.4.2"
	"github.com/docker/distribution 0d3efadf0154"
	"github.com/docker/go-events 9461782956ad"
	"github.com/docker/go-metrics 4ea375f7759c"
	"github.com/emicklei/go-restful v2.2.1"
	"github.com/gofrs/flock v0.7.1"
	"github.com/gogo/googleapis v1.0.0"
	"github.com/google/cadvisor v0.34.0"
	"github.com/hashicorp/errwrap 7554cd9344ce"
	"github.com/hashicorp/go-multierror ed905158d874"
	"github.com/j-keck/arping v1.0.0"
	"github.com/juju/errors 0232dcc7464d"
	"github.com/juju/loggo 6e530bcce5d8"
	"github.com/juju/testing ce30eb24acd2"
	"github.com/mindprince/gonvml 9ebdce4bb989"
	"github.com/mistifyio/go-zfs 166add352731"
	"github.com/opencontainers/go-digest c9281466c8b2"
	"github.com/opencontainers/image-spec v1.0.1"
	"github.com/opencontainers/runtime-tools v0.6.0"
	"github.com/opencontainers/selinux v1.2.2"
	"github.com/rakelkar/gonetsh 501daadcadf8"
	"github.com/seccomp/libseccomp-golang 32f571b70023"
	"github.com/syndtr/gocapability db04d3cc01c8"
	"github.com/tchap/go-patricia v2.2.6"
	"github.com/theckman/go-flock v0.7.1"
	"github.com/xeipuuv/gojsonpointer 4e3ac2762d5f"
	"github.com/xeipuuv/gojsonreference bd5ef7bd5415"
	"github.com/xeipuuv/gojsonschema 1d523034197f"
	"go.etcd.io/bbolt v1.3.1-etcd.8 github.com/etcd-io/bbolt"
	"gopkg.in/mgo.v2 a6b53ec6cb22 github.com/go-mgo/mgo"
	"k8s.io/utils 3a4a5477acf8 github.com/kubernetes/utils"
	)

inherit eutils golang-build golang-vcs-snapshot

ARCHIVE_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"
IUSE="rootless symlink"

DESCRIPTION="Lightweight Kubernetes. 5 less than k8s."
HOMEPAGE="https://k3s.io"
SRC_URI="${ARCHIVE_URI}
	${EGO_VENDOR_URI}"
LICENSE="Apache-2.0"
SLOT="0"

DEPEND="
	>=dev-lang/go-1.12
	net-firewall/conntrack-tools
	rootless? ( app-emulation/slirp4netns )
"

RESTRICT="strip mirror"

src_prepare() {
	default

	pushd src/${EGO_PN}

	# Use out version.sh
	cat <<EOF > scripts/version.sh
#!/bin/bash

COMMIT=$EGIT_COMMIT
GIT_TAG=$PV
VERSION=$PV

ARCH=\$(go env GOARCH)
SUFFIX="-\${ARCH}"

VERSION_CONTAINERD=\$(grep github.com/containerd/containerd \$(dirname \$0)/../go.mod | head -n1 | awk '{print \$4}')
VERSION_CRICTL=\$(grep github.com/kubernetes-sigs/cri-tools \$(dirname \$0)/../go.mod | head -n1 | awk '{print \$4}')
EOF

	# Disable go generate, create codegen only
	sed -i -e 's|go generate|go run pkg/codegen/main.go|' scripts/package-cli
}


src_compile() {
	pushd src/${EGO_PN}

	export GOPATH="${T}:$(get_golibdir_gopath)"
	export GOCACHE="${T}/go-cache"
	export GOFLAGS="-v -work -x -mod=vendor"

	# dont run ./scripts/download but at least:
	mkdir -p build/static/charts

	./scripts/build
	./scripts/package-cli

	popd
}

src_install() {
	pushd src/${EGO_PN}

	dobin dist/artifacts/k3s

	newinitd "${FILESDIR}/k3s.openrc" k3s
	newconfd "${FILESDIR}/k3s.conf" k3s

	into /var/lib/rancher/${PN}
	newbin "${FILESDIR}/killall_k3s.sh" killall_k3s.sh

	if use symlink; then
		for cmd in kubectl crictl ctr; do
			einfo "Linking ${cmd} to k3s"
			dosym k3s /usr/bin/${cmd}
		done
	fi
}

pkg_preinst() {
	K3S_ROOTLESS_UPGRADE=false
	if use rootless; then
		has_version 'sys-cluster/k3s[rootless]' || K3S_ROOTLESS_UPGRADE=true
	fi
}

pkg_postinst() {
	if [[ ${K3S_ROOTLESS_UPGRADE} == true ]] ; then
		elog "For rootless operation, you need to configure subuid/subgid"
		elog "for user running k3s. In case subuid/subgid has only been"
		elog "configured for root, run:"
		elog "usermod --add-subuids 1065536-1131071 <user>"
		elog "usermod --add-subgids 1065536-1131071 <user>"
	fi
}

pkg_setup() {
	if use rootless; then
		enewgroup ${PN}
		enewuser ${PN} -1 -1 /var/lib/rancher/${PN} ${PN}
	fi
}
