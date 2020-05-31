# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

EGO_PN="github.com/drone/drone"
EGIT_COMMIT="416f94afcd1596c8baf276e909acd1009088c695"
EGO_VENDOR=(
	"docker.io/go-docker v1.0.0 github.com/docker/go-docker"
	"github.com/99designs/httpsignatures-go 88528bf4ca7e"
	"github.com/Microsoft/go-winio v0.4.11"
	"github.com/asaskevich/govalidator ccb8e960c48f"
	"github.com/aws/aws-sdk-go v1.15.57"
	"github.com/beorn7/perks 3a771d992973"
	"github.com/bmatcuk/doublestar v1.1.1"
	"github.com/coreos/go-semver v0.2.0"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/dchest/authcookie fbdef6e99866"
	"github.com/dchest/uniuri 8902c56451e9"
	"github.com/docker/distribution v2.7.1"
	"github.com/docker/go-connections v0.3.0"
	"github.com/docker/go-units v0.3.3"
	"github.com/drone/drone-go 3e8b71333e59"
	"github.com/drone/drone-runtime v1.0.6"
	"github.com/drone/drone-ui b758d7bee2eb"
	"github.com/drone/drone-yaml v1.0.8"
	"github.com/drone/envsubst v1.0.1"
	"github.com/drone/go-license v1.0.2"
	"github.com/drone/go-login 2a4df4f242a2"
	"github.com/drone/go-scm 1e77204716f6"
	"github.com/drone/signal v1.0.0"
	"github.com/dustin/go-humanize v1.0.0"
	"github.com/ghodss/yaml v1.0.0"
	"github.com/go-chi/chi v3.3.3"
	"github.com/go-chi/cors v1.0.0"
	"github.com/go-ini/ini v1.39.0"
	"github.com/go-sql-driver/mysql v1.4.0"
	"github.com/gogo/protobuf 100ba4e88506"
	"github.com/golang/mock v1.1.1"
	"github.com/golang/protobuf v1.2.0"
	"github.com/google/btree 4030bb1f1f0c"
	"github.com/google/go-cmp v0.2.0"
	"github.com/google/go-jsonnet v0.12.1"
	"github.com/google/gofuzz 24818f796faf"
	"github.com/google/wire v0.2.1"
	"github.com/googleapis/gnostic v0.2.0"
	"github.com/gorhill/cronexpr a557574d6c02"
	"github.com/gosimple/slug v1.3.0"
	"github.com/gregjones/httpcache c63ab54fda8f"
	"github.com/h2non/gock v1.0.10"
	"github.com/hashicorp/errwrap v1.0.0"
	"github.com/hashicorp/go-cleanhttp v0.5.0"
	"github.com/hashicorp/go-multierror v1.0.0"
	"github.com/hashicorp/go-retryablehttp e651d75abec6"
	"github.com/hashicorp/go-rootcerts v1.0.0"
	"github.com/hashicorp/golang-lru v0.5.0"
	"github.com/hashicorp/nomad 134391155854"
	"github.com/imdario/mergo v0.3.6"
	"github.com/jmespath/go-jmespath 0b12d6b521d8"
	"github.com/jmoiron/sqlx 0dae4fefe7c0"
	"github.com/joho/godotenv v1.3.0"
	"github.com/json-iterator/go v1.1.5"
	"github.com/kelseyhightower/envconfig v1.3.0"
	"github.com/konsorten/go-windows-terminal-sequences v1.0.1"
	"github.com/lib/pq v1.0.0"
	"github.com/mattn/go-sqlite3 v1.9.0"
	"github.com/matttproud/golang_protobuf_extensions v1.0.1"
	"github.com/mitchellh/go-homedir v1.0.0"
	"github.com/modern-go/concurrent bacd9c7ef1dd"
	"github.com/modern-go/reflect2 4b7aa43c6742"
	"github.com/natessilva/dag 7194b8dcc5c4"
	"github.com/opencontainers/go-digest v1.0.0-rc1"
	"github.com/opencontainers/image-spec v1.0.1"
	"github.com/oxtoacart/bpool 4e1c5567d7c2"
	"github.com/petar/GoLLRB 53be0d36a84c"
	"github.com/peterbourgon/diskv v2.0.1"
	"github.com/pkg/errors v0.8.0"
	"github.com/prometheus/client_golang v0.8.0"
	"github.com/prometheus/client_model 5c3871d89910"
	"github.com/prometheus/common c7de2306084e"
	"github.com/prometheus/procfs 185b4288413d"
	"github.com/rainycape/unidecode cb7f23ec59be"
	"github.com/robfig/cron b41be1df6967"
	"github.com/segmentio/ksuid v1.0.2"
	"github.com/sirupsen/logrus 44067abb194b"
	"github.com/spf13/pflag v1.0.3"
	"github.com/unrolled/secure 4b6b7cf51606"
	"golang.org/x/crypto 505ab145d0a9 github.com/golang/crypto"
	"golang.org/x/net 49bb7cea24b1 github.com/golang/net"
	"golang.org/x/oauth2 d668ce993890 github.com/golang/oauth2"
	"golang.org/x/sync 1d60e4601c6f github.com/golang/sync"
	"golang.org/x/sys fa43e7bc11ba github.com/golang/sys"
	"golang.org/x/text v0.3.0 github.com/golang/text"
	"golang.org/x/time 85acf8d2951c github.com/golang/time"
	"google.golang.org/appengine v1.3.0 github.com/golang/appengine"
	"gopkg.in/check.v1 788fd7840127 github.com/go-check/check"
	"gopkg.in/inf.v0 v0.9.1 github.com/go-inf/inf"
	"gopkg.in/yaml.v2 v2.2.2 github.com/go-yaml/yaml"
	"k8s.io/api d04500c8c3dd github.com/kubernetes/api"
	"k8s.io/apimachinery eb8c8024849b github.com/kubernetes/apimachinery"
	"k8s.io/client-go v10.0.0 github.com/kubernetes/client-go"
	"k8s.io/klog v0.1.0 github.com/kubernetes/klog"
	"sigs.k8s.io/yaml v1.1.0 github.com/kubernetes-sigs/yaml"
	)
inherit golang-build golang-vcs-snapshot user

ARCHIVE_URI="https://${EGO_PN}/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"
KEYWORDS="~amd64"
IUSE="ose"

DESCRIPTION="A Continuous Delivery platform built on Docker, written in Go"
HOMEPAGE="https://github.com/drone/drone"
SRC_URI="${ARCHIVE_URI}
	${EGO_VENDOR_URI}"
LICENSE="Apache-2.0 !ose? ( Drone Enterprise License )"
SLOT="0"

# We build with ldflags -s -w
RESTRICT="strip mirror"

pkg_setup() {
	enewgroup ${PN}
	enewuser ${PN} -1 -1 /var/lib/drone ${PN}
}

src_compile() {
	pushd src/${EGO_PN}

	EGO_BUILD_FLAGS="-o ${T}/drone-server -mod=vendor"
	if use ose; then
		EGO_BUILD_FLAGS="$EGO_BUILD_FLAGS -tags oss"
	fi
	EGO_PN="${EGO_PN}/cmd/drone-server"

	export CGO_ENABLED=1
	set -- env GOPATH="${T}:$(get_golibdir_gopath)" \
		GOCACHE="${T}/go-cache" \
		go build -v -work -x ${EGO_BUILD_FLAGS} -ldflags "-s -w -X ${EGO_PN}/version.VersionDev=build.${PV}.${EGIT_COMMIT:0:7}" "${EGO_PN}"
	echo "$@"
	"$@" || die
	popd
}

src_install() {
	dobin ${T}/drone-server
	keepdir /var/log/drone-server /var/lib/drone
	fowners -R ${PN}:${PN} /var/log/drone-server /var/lib/drone
	newinitd "${FILESDIR}"/drone-server.initd drone-server
	newconfd "${FILESDIR}"/drone-server.confd drone-server
}
