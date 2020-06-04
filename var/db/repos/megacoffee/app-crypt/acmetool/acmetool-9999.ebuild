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
		"github.com/alecthomas/kingpin:947dcec5ba9c011838740e680966fd7087a71d0d -> gopkg.in/alecthomas/kingpin.v2" # v2.2.6
		"github.com/alecthomas/template:fb15b899a75114aa79cc930e33c46b577cc664b1"
		"github.com/alecthomas/units:f65c72e2690dc4b403c8bd637baf4611cd4c069b"
		"github.com/cheggaaa/pb:f907f6f5dd81f77c2bbc1cde92e4c5a04720cb11 -> gopkg.in/cheggaaa/pb.v1" # v1.0.28
		"github.com/coreos/go-systemd:2d78030078ef61b3cae27f42ad6d0e46db51b339" # v22.0.0
		"github.com/godbus/dbus:37bf87eef99d69c4f1d3528bd66e3a87dc201472" # v5.0.3
		"github.com/golang/crypto:06a226fb4e3765ef3f48aa2852b401bc7b98e981 -> golang.org/x"
		"github.com/golang/net:3c3fba18258b2a1398a025a6aeb7374d2a470009 -> golang.org/x"
		"github.com/golang/sys:05986578812163b26672dabd9b425240ae2bb0ad -> golang.org/x"
		"github.com/golang/text:81608d7e9c6863c922f599e4ff1329a685218c0d -> golang.org/x"
		"github.com/go-yaml/yaml:0b1645d91e851e735d3e23330303ce81f70adbe3 -> gopkg.in/yaml.v2" # v2.3.0
		"github.com/hlandau/acmeapi:4c466ab079c59d00344630cb861d075f3a75bc56 -> gopkg.in/hlandau/acmeapi.v2" # v2.0.1
		"github.com/hlandau/buildinfo:337a29b5499734e584d4630ce535af64c5fe7813"
		"github.com/hlandau/configurable:41496864a1fe3e0fef2973f22372b755d2897402 -> gopkg.in/hlandau/configurable.v1" # v1.0.1
		"github.com/hlandau/dexlogconfig:244f29bd260884993b176cd14ef2f7631f6f3c18"
		"github.com/hlandau/easyconfig:c31249162931b4963bbe6e501cccb60d23271a3f -> gopkg.in/hlandau/easyconfig.v1" # v1.0.17
		"github.com/hlandau/goutils:0cdb66aea5b843822af6fdffc21286b8fe8379c4"
		"github.com/hlandau/service:b64b3467ebd16f64faec1640c25e318efc0c0d7b -> gopkg.in/hlandau/service.v2" # v2.0.16
		"github.com/hlandau/svcutils:c25dac49e50cbbcbef8c81b089f56156f4067729 -> gopkg.in/hlandau/svcutils.v1" # v1.0.10
		"github.com/hlandau/xlog:197ef798aed28e08ed3e176e678fda81be993a31"
		"github.com/jmhodges/clock:880ee4c335489bc78d01e4d0a254ae880734bc15" # v1.1
		"github.com/mattn/go-isatty:7b513a986450394f7bbf1476909911b3aa3a55ce" # v0.0.12
		"github.com/mattn/go-runewidth:14e809f6d78fcf9f48ff9b70981472b64c05f754" # v0.0.9
		"github.com/mitchellh/go-wordwrap:9e67c67572bc5dd02aef930e2b0ae3c02a4b5a5c" # v1.0.0
		"github.com/ogier/pflag:45c278ab3607870051a2ea9040bb85fcb8557481"
		"github.com/peterhellberg/link:7d8125c3085c14bd320d898c73b78ef2c5320f31" # v1.1.0
		"github.com/satori/go.uuid:b2ce2384e17bbe0c6d34077efa39dbab3e09123b"
#		"github.com/satori/go.uuid:f58768cc1a7a7e77a3bd49e98cdd21419399b6a3" # v1.2.0 (incompatible API)
#		"github.com/satori/go.uuid:879c5887cd475cd7864858769793b2ceb0d44feb" # v1.1.0 (incompatible API)
		"github.com/shiena/ansicolor:a422bbe96644373c5753384a59d678f7d261ff10"
		"github.com/square/go-jose:3a5ee095dcb5030a9de84fb92c222ac652fff176 -> gopkg.in/square/go-jose.v2" # v2.5.1
		"github.com/square/go-jose:56062818b5e15ee405eb8363f9498c7113e98337 -> gopkg.in/square/go-jose.v1" # v1.1.2 (yes, we need both v1 and v2)
		"github.com/tylerstillwater/graceful:4654dfbb6ad53cb5e27f37d99b02e16c1872fbbb -> gopkg.in/tylerb/graceful.v1" # v1.2.15
	)
	inherit golang-single
	KEYWORDS="~amd64 ~x86"
fi

LICENSE="MIT"
SLOT="0"
IUSE="doc"

DEPEND="dev-lang/go sys-libs/libcap"
RDEPEND="${DEPEND}"
