EAPI=4
inherit eutils
#EAP='-EAP'
PVERSION='2016.1.1'
HOMEPAGE="http://www.jetbrains.com/clion/"
DESCRIPTION="JetBrains C(C++) IDE, Non free used, use license"
SRC_URI="https://download.jetbrains.com/cpp/CLion-${PVERSION:-${PV}}.tar.gz"

if [[ x${PVERSION} != 'x' ]]; then
	KEYWORDS="x86 amd64"
else
	KEYWORDS="~x86 ~amd64"
fi

PROGNAME="Clion"
RESTRICT="strip mirror"
DEPEND="|| ( >=virtual/jre-1.8 >=virtual/jdk-1.8 )"
SLOT="0"
S=${WORKDIR}
src_install() {
	dodir /opt/${PN}

	cd clion*/
	insinto /opt/${PN}
	doins -r *

	fperms a+x /opt/${PN}/bin/clion.sh || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "Chmod failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "Chmod failed"
	dosym /opt/${PN}/bin/clion.sh /usr/bin/${PN}
	
	mv "bin/clion.svg" "bin/${PN}.svg"
	doicon "bin/${PN}.svg"
	make_desktop_entry ${PN} "${PROGNAME}" "${PN}"
}
pkg_postinst() {
    elog "Run /usr/bin/${PN}"
}


