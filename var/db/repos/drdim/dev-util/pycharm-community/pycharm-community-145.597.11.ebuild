EAPI="4"
inherit eutils
#PVERSION="2016.1.2"
#PVERSION_EAP="4.5.3"
EAP=${PV}
DESCRIPTION="PyCharm Community Edition 2016 EAP version I't Free."
HOMEPAGE="www.jetbrains.com/pycharm/"
SRC_URI="https://download.jetbrains.com/python/pycharm-community-${PVERSION}${EAP}.tar.gz"

if [[ x${PVERSION} != 'x' ]]; then
	KEYWORDS="x86 amd64"
else
	KEYWORDS="~x86 ~amd64"
fi

DEPEND="|| ( >=virtual/jre-1.8 >=virtual/jdk-1.8 )"
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
SLOT="0"
S=${WORKDIR}
src_install() {	
	dodir /opt/${PN}
		
	insinto /opt/${PN}
	cd ${PN}-${PVERSION:-${PVERSION_EAP}}
	doins -r *
	fperms a+x /opt/${PN}/bin/pycharm.sh || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "fperms failed"
	fperms a+x /opt/${PN}/bin/inspect.sh || die "fperms failed"
	dosym /opt/${PN}/bin/pycharm.sh /usr/bin/${PN}
	
	mv "bin/pycharm.png" "bin/${PN}.png"
	doicon "bin/${PN}.png"

	make_desktop_entry ${PN} "${PN}" "${PN}"
}
pkg_postinst() {
    elog "Run /usr/bin/${PN}"
}

