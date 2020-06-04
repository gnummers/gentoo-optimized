# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit go-module

DESCRIPTION="Email client for your terminal"
HOMEPAGE="https://aerc-mail.org"

EGO_SUM=(
	"cloud.google.com/go v0.34.0/go.mod"
	"git.sr.ht/~sircmpwn/getopt v0.0.0-20190621174457-292febf82fd0"
	"git.sr.ht/~sircmpwn/getopt v0.0.0-20190621174457-292febf82fd0/go.mod"
	"git.sr.ht/~sircmpwn/pty v0.0.0-20190330154901-3a43678975a9"
	"git.sr.ht/~sircmpwn/pty v0.0.0-20190330154901-3a43678975a9/go.mod"
	"git.sr.ht/~sircmpwn/tcell v0.0.0-20190807054800-3fdb6bc01a50"
	"git.sr.ht/~sircmpwn/tcell v0.0.0-20190807054800-3fdb6bc01a50/go.mod"
	"github.com/DATA-DOG/go-sqlmock v1.3.3"
	"github.com/DATA-DOG/go-sqlmock v1.3.3/go.mod"
	"github.com/danwakefield/fnmatch v0.0.0-20160403171240-cbb64ac3d964"
	"github.com/danwakefield/fnmatch v0.0.0-20160403171240-cbb64ac3d964/go.mod"
	"github.com/davecgh/go-spew v1.1.0"
	"github.com/davecgh/go-spew v1.1.0/go.mod"
	"github.com/davecgh/go-spew v1.1.1"
	"github.com/davecgh/go-spew v1.1.1/go.mod"
	"github.com/ddevault/go-libvterm v0.0.0-20190526194226-b7d861da3810"
	"github.com/ddevault/go-libvterm v0.0.0-20190526194226-b7d861da3810/go.mod"
	"github.com/emersion/go-imap v1.0.0"
	"github.com/emersion/go-imap v1.0.0/go.mod"
	"github.com/emersion/go-imap-idle v0.0.0-20190519112320-2704abd7050e"
	"github.com/emersion/go-imap-idle v0.0.0-20190519112320-2704abd7050e/go.mod"
	"github.com/emersion/go-maildir v0.0.0-20190727102040-941194b0ac70"
	"github.com/emersion/go-maildir v0.0.0-20190727102040-941194b0ac70/go.mod"
	"github.com/emersion/go-message v0.10.4-0.20190609165112-592ace5bc1ca/go.mod"
	"github.com/emersion/go-message v0.10.7"
	"github.com/emersion/go-message v0.10.7/go.mod"
	"github.com/emersion/go-sasl v0.0.0-20190520160400-47d427600317"
	"github.com/emersion/go-sasl v0.0.0-20190520160400-47d427600317/go.mod"
	"github.com/emersion/go-sasl v0.0.0-20190704090222-36b50694675c"
	"github.com/emersion/go-sasl v0.0.0-20190704090222-36b50694675c/go.mod"
	"github.com/emersion/go-sasl v0.0.0-20190817083125-240c8404624e"
	"github.com/emersion/go-sasl v0.0.0-20190817083125-240c8404624e/go.mod"
	"github.com/emersion/go-smtp v0.11.2"
	"github.com/emersion/go-smtp v0.11.2/go.mod"
	"github.com/emersion/go-textwrapper v0.0.0-20160606182133-d0e65e56babe"
	"github.com/emersion/go-textwrapper v0.0.0-20160606182133-d0e65e56babe/go.mod"
	"github.com/fsnotify/fsnotify v1.4.7"
	"github.com/fsnotify/fsnotify v1.4.7/go.mod"
	"github.com/gdamore/encoding v1.0.0"
	"github.com/gdamore/encoding v1.0.0/go.mod"
	"github.com/go-ini/ini v1.44.0"
	"github.com/go-ini/ini v1.44.0/go.mod"
	"github.com/golang/protobuf v1.2.0/go.mod"
	"github.com/golang/protobuf v1.3.1/go.mod"
	"github.com/golang/protobuf v1.3.2"
	"github.com/golang/protobuf v1.3.2/go.mod"
	"github.com/google/shlex v0.0.0-20181106134648-c34317bd91bf"
	"github.com/google/shlex v0.0.0-20181106134648-c34317bd91bf/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1"
	"github.com/gopherjs/gopherjs v0.0.0-20181017120253-0766667cb4d1/go.mod"
	"github.com/gopherjs/gopherjs v0.0.0-20190430165422-3e4dfb77656c"
	"github.com/gopherjs/gopherjs v0.0.0-20190430165422-3e4dfb77656c/go.mod"
	"github.com/jtolds/gls v4.20.0+incompatible"
	"github.com/jtolds/gls v4.20.0+incompatible/go.mod"
	"github.com/kyoh86/xdg v1.0.0"
	"github.com/kyoh86/xdg v1.0.0/go.mod"
	"github.com/lucasb-eyer/go-colorful v1.0.2"
	"github.com/lucasb-eyer/go-colorful v1.0.2/go.mod"
	"github.com/martinlindhe/base36 v0.0.0-20190418230009-7c6542dfbb41"
	"github.com/martinlindhe/base36 v0.0.0-20190418230009-7c6542dfbb41/go.mod"
	"github.com/martinlindhe/base36 v1.0.0"
	"github.com/martinlindhe/base36 v1.0.0/go.mod"
	"github.com/mattn/go-isatty v0.0.8"
	"github.com/mattn/go-isatty v0.0.8/go.mod"
	"github.com/mattn/go-pointer v0.0.0-20180825124634-49522c3f3791"
	"github.com/mattn/go-pointer v0.0.0-20180825124634-49522c3f3791/go.mod"
	"github.com/mattn/go-runewidth v0.0.4"
	"github.com/mattn/go-runewidth v0.0.4/go.mod"
	"github.com/miolini/datacounter v0.0.0-20190724021726-aa48df3a02c1"
	"github.com/miolini/datacounter v0.0.0-20190724021726-aa48df3a02c1/go.mod"
	"github.com/mitchellh/go-homedir v1.1.0"
	"github.com/mitchellh/go-homedir v1.1.0/go.mod"
	"github.com/pkg/errors v0.8.1"
	"github.com/pkg/errors v0.8.1/go.mod"
	"github.com/pmezard/go-difflib v1.0.0"
	"github.com/pmezard/go-difflib v1.0.0/go.mod"
	"github.com/riywo/loginshell v0.0.0-20190610082906-2ed199a032f6"
	"github.com/riywo/loginshell v0.0.0-20190610082906-2ed199a032f6/go.mod"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d"
	"github.com/smartystreets/assertions v0.0.0-20180927180507-b2de0cb4f26d/go.mod"
	"github.com/smartystreets/assertions v1.0.1"
	"github.com/smartystreets/assertions v1.0.1/go.mod"
	"github.com/smartystreets/goconvey v0.0.0-20190710185942-9d28bd7c0945"
	"github.com/smartystreets/goconvey v0.0.0-20190710185942-9d28bd7c0945/go.mod"
	"github.com/stretchr/objx v0.1.0/go.mod"
	"github.com/stretchr/testify v1.3.0"
	"github.com/stretchr/testify v1.3.0/go.mod"
	"github.com/zenhack/go.notmuch v0.0.0-20190726231123-3d59f87d986e"
	"github.com/zenhack/go.notmuch v0.0.0-20190726231123-3d59f87d986e/go.mod"
	"github.com/zenhack/go.notmuch v0.0.0-20190821052706-5a1961965cfb"
	"github.com/zenhack/go.notmuch v0.0.0-20190821052706-5a1961965cfb/go.mod"
	"golang.org/x/crypto v0.0.0-20190308221718-c2843e01d9a2/go.mod"
	"golang.org/x/crypto v0.0.0-20190605123033-f99c8df09eb5/go.mod"
	"golang.org/x/image v0.0.0-20190523035834-f03afa92d3ff/go.mod"
	"golang.org/x/net v0.0.0-20180724234803-3673e40ba225/go.mod"
	"golang.org/x/net v0.0.0-20190108225652-1e06a53dbb7e/go.mod"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a"
	"golang.org/x/net v0.0.0-20190311183353-d8887717615a/go.mod"
	"golang.org/x/net v0.0.0-20190404232315-eb5bcb51f2a3/go.mod"
	"golang.org/x/net v0.0.0-20190603091049-60506f45cf65/go.mod"
	"golang.org/x/net v0.0.0-20190813141303-74dc4d7220e7"
	"golang.org/x/net v0.0.0-20190813141303-74dc4d7220e7/go.mod"
	"golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45"
	"golang.org/x/oauth2 v0.0.0-20190604053449-0f29369cfe45/go.mod"
	"golang.org/x/sync v0.0.0-20181221193216-37e7f081c4d4/go.mod"
	"golang.org/x/sync v0.0.0-20190423024810-112230192c58/go.mod"
	"golang.org/x/sys v0.0.0-20190215142949-d0b11bdaac8a/go.mod"
	"golang.org/x/sys v0.0.0-20190222072716-a9d3bda3a223/go.mod"
	"golang.org/x/sys v0.0.0-20190412213103-97732733099d/go.mod"
	"golang.org/x/sys v0.0.0-20190606165138-5da285871e9c/go.mod"
	"golang.org/x/sys v0.0.0-20190626150813-e07cf5db2756/go.mod"
	"golang.org/x/sys v0.0.0-20190813064441-fde4db37ae7a"
	"golang.org/x/sys v0.0.0-20190813064441-fde4db37ae7a/go.mod"
	"golang.org/x/text v0.3.0"
	"golang.org/x/text v0.3.0/go.mod"
	"golang.org/x/text v0.3.2"
	"golang.org/x/text v0.3.2/go.mod"
	"golang.org/x/tools v0.0.0-20180917221912-90fa682c2a6e/go.mod"
	"golang.org/x/tools v0.0.0-20190328211700-ab21143f2384/go.mod"
	"golang.org/x/tools v0.0.0-20190606124116-d0a3d012864b/go.mod"
	"google.golang.org/appengine v1.4.0/go.mod"
	"google.golang.org/appengine v1.6.1"
	"google.golang.org/appengine v1.6.1/go.mod"
	"gopkg.in/ini.v1 v1.44.0"
	"gopkg.in/ini.v1 v1.44.0/go.mod"
	)
go-module_set_globals
SRC_URI="https://git.sr.ht/~sircmpwn/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz
	${EGO_SUM_SRC_URI}"

LICENSE="Apache-2.0 BSD BSD-2 MIT"
SLOT="0"
KEYWORDS="~amd64 ~ppc64"

BDEPEND=">=app-text/scdoc-1.9.7"

src_compile() {
	emake PREFIX="${EPREFIX}/usr"
}

src_install() {
	emake PREFIX="${EPREFIX}/usr" DESTDIR="${ED}" install
	einstalldocs
}

pkg_postinst() {
	if [[ -z ${REPLACING_VERSIONS} ]]; then
		elog "If you want to allow your users to activate html email"
		elog "processing via w3m as shown in the tutorial, make sure you"
		elog "emerge net-proxy/dante and www-client/w3m"
	fi

	local v
	for v in ${REPLACING_VERSIONS}; do
		if ver_test $v -lt 0.3.0-r1; then
			elog "The dependencies on net-proxy/dante and www-client/w3m"
			elog "have been removed since they are optional."
			elog "Please emerge them before the next --depclean if you"
			elog "need to use them."
		fi
	done
}