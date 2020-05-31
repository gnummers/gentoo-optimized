EAPI="4"
inherit eutils

PVERSION='3.4.1'
#PVERSION_EAP='3.1.1'
EAP=''

DESCRIPTION="PyCharm Professional build, non-free EAP 3.4.1, can buy license"
HOMEPAGE="www.jetbrains.com/pycharm/"

SRC_URI="https://download.jetbrains.com/python/pycharm-professional${EAP}-${PVERSION:-${PV}}.tar.gz"

if [[ x${PVERSION} != 'x' ]]; then
	KEYWORDS="x86 amd64"
else
	KEYWORDS="~x86 ~amd64"
fi

DEPEND=">=virtual/jre-1.6"
RDEPEND="${DEPEND}"
RESTRICT="strip mirror"
SLOT="0"
S=${WORKDIR}

src_install() {	
	dodir /opt/${PN}
		
	insinto /opt/${PN}
	cd pycharm-${PVERSION}
	doins -r *
	fperms a+x /opt/${PN}/bin/pycharm.sh || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier || die "fperms failed"
	fperms a+x /opt/${PN}/bin/fsnotifier64 || die "fperms failed"
	fperms a+x /opt/${PN}/bin/inspect.sh || die "fperms failed"
	dosym /opt/${PN}/bin/pycharm.sh /usr/bin/${PN}

	doicon "bin/${PN}.png"
	make_desktop_entry ${PN} "${PN}" "${PN}"
}

pkg_postinst() {
    elog "Run /usr/bin/${PN}"
}

