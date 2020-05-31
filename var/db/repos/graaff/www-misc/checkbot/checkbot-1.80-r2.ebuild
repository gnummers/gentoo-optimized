# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit perl-module

DESCRIPTION="Checkbot is a tool to verify links on a set of HTML pages."
HOMEPAGE="https://degraaff.org/checkbot/"
SRC_URI="https://degraaff.org/checkbot/${P}.tar.gz"

LICENSE="Artistic"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=">=dev-lang/perl-5.5
	>=dev-perl/libwww-perl-5.803
	>=dev-perl/URI-1.10
	>=dev-perl/HTML-Parser-3.33
	>=virtual/perl-MIME-Base64-2.00
	>=virtual/perl-libnet-1.19
	virtual/perl-Digest-MD5
	dev-perl/MailTools
	dev-perl/Time-Duration
	dev-perl/Crypt-SSLeay"
RDEPEND="${DEPEND}"
