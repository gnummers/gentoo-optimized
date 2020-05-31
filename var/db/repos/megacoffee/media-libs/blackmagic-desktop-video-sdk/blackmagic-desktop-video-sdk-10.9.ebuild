# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="Desktop Video SDK - headers, examples and documentation necessary to develop/compile custom applications for products by Blackmagic Design (also known as DeckLink SDK)"
HOMEPAGE="http://www.blackmagicdesign.com/"
HOMEPAGE_DOWNLOAD_NAME="Desktop Video ${PV} SDK"

SRC_URI="Blackmagic_DeckLink_SDK_${PV}.zip"
UNPACKED_DIR="Blackmagic DeckLink SDK ${PV}"

LICENSE="BlackmagicDesktopVideoSDK"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc examples"
RESTRICT="fetch"

pkg_nofetch() {
	einfo "Please visit ${HOMEPAGE} and download \"${HOMEPAGE_DOWNLOAD_NAME}\""
	einfo "for your product from the support section and move it to ${DISTDIR}"
	einfo ""
	einfo "  expected filename: ${SRC_URI}"
	#einfo ""
	#einfo "If your browser downloads a .tar.gz file you will need to gunzip it."
}

src_unpack() {
	unpack ${A}
	
	# symlink to what is supposed to have been prepared
	ln -s "${UNPACKED_DIR}" "${P}"
}

src_install() {
	# do not compress documentation (only RTF) or samples (makes no sense)
	docompress -x /usr/share/doc
	
	use doc && dodoc -r *.pdf *.rtf
	use examples && dodoc -r Examples Linux/Samples
	
	insinto "/usr/include/blackmagic"
	doins -r Linux/include/*
}
