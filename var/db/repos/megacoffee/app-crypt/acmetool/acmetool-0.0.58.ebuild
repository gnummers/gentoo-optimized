# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$
EAPI=7

GOLANG_PKG_IMPORTPATH="github.com/hlandau"
GOLANG_PKG_BUILDPATH="/cmd/acmetool"
GOLANG_PKG_ARCHIVEPREFIX="v"
GOLANG_PKG_NAME="acmetool"
#GOLANG_PKG_IS_MULTIPLE="1"
# Without this, dropping privs is non-functional, which (generally) breaks
# redirector
#GOLANG_PKG_USE_CGO=1

DESCRIPTION="command line tool for automatically acquiring certificates from ACME servers"
HOMEPAGE="https://github.com/hlandau/acmetool"
if [[ "${PV}" = 9999 ]]; then
	inherit golang-live
	KEYWORDS=""
else
	GOLANG_PKG_DEPENDENCIES=(
		"github.com/coreos/go-systemd:b4a58d9" # v4
		"github.com/hlandau/xlog:197ef798aed28e08ed3e176e678fda81be993a31"
		"github.com/hlandau/goutils:0cdb66aea5b843822af6fdffc21286b8fe8379c4"
		"github.com/mitchellh/go-wordwrap:ad45545899c7b13c020ea92b2072220eefad42b8"
		"github.com/peterhellberg/link:d1cebc7ea14a5fc0de7cb4a45acae773161642c6" #v1.0.0
		"github.com/jmhodges/clock:880ee4c335489bc78d01e4d0a254ae880734bc15"
		"github.com/hlandau/dexlogconfig:055e2e35f21ef605ada9e9af4e36597678678bf1"
		"github.com/satori/go.uuid:b061729afc07e77a8aa4fad0a2fd840958f1942a"
		"github.com/golang/crypto:568507f56e5b05b3c219ffd7fba12655c07bcc86 -> golang.org/x"
		"github.com/golang/net:cd95c68ba21fc7ee16ee38cc420473e3d8c4afd8    -> golang.org/x"
		"github.com/go-yaml/yaml:a5b47d31c556af34a302ce5d659e6fea44d90de0  -> gopkg.in/yaml.v2"
		"github.com/tylerb/graceful:48afeb2 -> gopkg.in/tylerb/graceful.v1" #v1.2.3
		"github.com/hlandau/svcutils:c25dac49e50cbbcbef8c81b089f56156f4067 -> gopkg.in/hlandau/svcutils.v1"
		"github.com/hlandau/service:601cce2a79c1e61856e27f43c28ed4d7d2c7a619 -> gopkg.in/hlandau/service.v2" #v2.0.15
		"github.com/godbus/dbus:9998ce8520caaa4a287fa5122ecb5d1ca1aeaede"
		"github.com/hlandau/buildinfo:b25d4b0e518fdb8bcbefaa3d52d77473bebe08fd"
		"github.com/hlandauf/gspt:25f3bd3f5948489aa5f31c949310ae9f2b0e956c"
		"github.com/mattn/go-isatty:66b8e73f3f5cda9f96b69efd03dd3d7fc4a5cdb8"
		"github.com/shiena/ansicolor:a422bbe96644373c5753384a59d678f7d261ff10"
		"github.com/alecthomas/kingpin:8852570 -> gopkg.in/alecthomas/kingpin.v2" #v2.1.18
		"github.com/cheggaaa/pb:ad4efe000aa550bb54918c06ebbadc0ff17687b9 -> gopkg.in/cheggaaa/pb.v1"
		"github.com/hlandau/easyconfig:bc5afaa18a1a72fe424da647d6bb57ca4d7f83c4 -> gopkg.in/hlandau/easyconfig.v1"
		"github.com/square/go-jose:e18a7432cde1d90f722109d29224965a1eec5c79 -> gopkg.in/square/go-jose.v1" #v1.1.0
		"github.com/alecthomas/template:a0175ee3bccc567396460bf5acd36800cb10c49c"
		"github.com/alecthomas/units:2efee857e7cfd4f3d0138cc3cbb1b4966962b93a"
		"github.com/ogier/pflag:45c278ab3607870051a2ea9040bb85fcb8557481"
		"github.com/hlandau/configurable:34642c4c8cbf56801d0e34f0e82187305983ac26 -> gopkg.in/hlandau/configurable.v1"
	)
	inherit golang-single
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="doc"

DEPEND="dev-lang/go sys-libs/libcap"
RDEPEND="${DEPEND}"

PATCHES="${FILESDIR}/${PV}-github-rename.patch"
