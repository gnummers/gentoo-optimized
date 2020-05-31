# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

GITHUB_COMMIT="ef124bfb1534e3edbcb4002ad3d2320a81d09585"

DESCRIPTION="Improved MySQL Graphs for Munin"
HOMEPAGE="https://github.com/kjellm/munin-mysql"
LICENSE="GPL-2"

SRC_URI="https://github.com/kjellm/munin-mysql/archive/${GITHUB_COMMIT}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${GITHUB_COMMIT}"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

RDEPEND="
	dev-perl/DBD-mysql
	dev-perl/DBI
	dev-perl/Module-Pluggable
	net-analyzer/munin
"

# Depends on unpackaged Test-Regression
RESTRICT="test"

src_prepare() {
	# Don't restart node automatically.
	sed -i -e '/restart/d' Makefile || die
}

src_install() {
	local config="${D}/etc/munin"
	local perllib="${D}"$(perl '-V:installvendorlib'|cut -d"'" -f2)

	mkdir -p "${config}/plugins" "${config}/plugin-conf.d" || die

	emake PLUGIN_DIR="${D}/usr/share/munin/plugins" \
		CONFIG_DIR="${config}" \
		PERL_SITELIB_DIR="${perllib}" \
		install
}
