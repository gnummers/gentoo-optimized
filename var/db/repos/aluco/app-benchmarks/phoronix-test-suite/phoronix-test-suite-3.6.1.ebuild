# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=4

inherit eutils bash-completion-r1

DESCRIPTION="Phoronix's comprehensive, cross-platform testing and benchmark suite"
HOMEPAGE="http://www.phoronix-test-suite.com"
SRC_URI="http://www.phoronix-test-suite.com/download.php?file=${P} -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""

# php 5.3 doesn't have pcre and reflection useflags anymore
RDEPEND="dev-lang/php:5.3[cli,curl,gd,posix,pcntl,truetype,zip]
		dev-php/pecl-ps"

S="${WORKDIR}/${PN}"

src_prepare() {
	sed -i -e "s,export PTS_DIR=\`pwd\`,export PTS_DIR=\"/usr/share/${PN}\"," \
		phoronix-test-suite
	epatch "${FILESDIR}"/${P}-lspci.patch
}

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	dodir /usr/share/${PN}
	insinto /usr/share/${PN}

	doman documentation/man-pages/phoronix-test-suite.1
	dodoc AUTHORS CHANGE-LOG
	dohtml -r documentation/
	doicon pts-core/static/images/phoronix-test-suite.png
	doicon pts-core/static/images/openbenchmarking.png
	domenu pts-core/static/phoronix-test-suite.desktop
	rm -f pts-core/static/phoronix-test-suite.desktop

	doins -r pts-core
	exeinto /usr/bin
	doexe phoronix-test-suite

	#fperms a+x /usr/share/${PN}/pts/test-resources/*/*.sh
	#fperms a+x /usr/share/${PN}/pts/base-test-resources/*/*.sh
	#fperms a+x /usr/share/${PN}/pts-core/modules/*.sh
	#fperms a+x /usr/share/${PN}/pts-core/test-libraries/*.sh
	fperms a+x /usr/share/${PN}/pts-core/static/scripts/root-access.sh
	fperms a+x /usr/share/${PN}/pts-core/external-test-dependencies/scripts/install-gentoo-packages.sh

	newbashcomp pts-core/static/bash_completion ${PN}

	ewarn
	ewarn "phoronix-test-suite needs the 'allow_url_fopen' option set to \"On\""
	ewarn "in your /etc/php/cli-php5.*/php.ini for downloading to work properly."
	ewarn
	ewarn "If you upgrade from phoronix-test-suite-2*, you should reinstall all"
	ewarn "your tests because"
	ewarn "   \$HOME/.phoronix-test-suite/installed-tests/\$TEST_NAME/"
	ewarn "moves to"
	ewarn "   \$HOME/.phoronix-test-suite/installed-tests/pts/\$TEST_NAME-\$TEST_VERSION/"
	ewarn "in phoronix-test-suite-3* version. The \$TEST_VERSION can be find in"
	ewarn "pts-install.xml file."
	ewarn
}
