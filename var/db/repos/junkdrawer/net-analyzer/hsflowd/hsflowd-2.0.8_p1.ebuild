# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5

MY_PV=${PV/_p/-}
MY_P=${PN}-${MY_PV}

DESCRIPTION="Exports physical and virtual server performance metrics using the sFlow protocol"
HOMEPAGE="http://www.sflow.net"
SRC_URI="https://github.com/sflow/host-sflow/archive/v${MY_PV}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="APL-1.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="nflog openvswitch pcap"

DEPEND="nflog? ( net-libs/libnfnetlink )
	pcap? ( net-libs/libpcap )"
RDEPEND="${DEPEND}"

S="${WORKDIR}/host-sflow-${MY_PV}"

src_compile() {
	local features=()
	use nflog && features+=( 'NFLOG' )
	use openvswitch && features+=( 'OVS' )
	use pcap && features+=( 'PCAP' )
	local emakeopts=( FEATURES="${features[@]}" )
	emake "${emakeopts[@]}"
}

src_install() {
	emake install INSTROOT="${D}" MODDIR="/usr/lib64/${PN}"
}
