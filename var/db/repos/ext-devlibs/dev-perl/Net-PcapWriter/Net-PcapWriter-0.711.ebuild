# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-perl/Net-PcapUtils/Net-PcapUtils-0.10.0.ebuild,v 1.3 2012/03/25 16:08:47 armin76 Exp $

EAPI=5

MODULE_AUTHOR=SULLR
MODULE_VERSION=${PV}
inherit perl-module

DESCRIPTION="Perl Net::PcapWriter - simple creation of pcap files from code"

SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-perl/Net-Pcap"
DEPEND="${RDEPEND}"
