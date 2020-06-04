# Copyright 2011-2020 Martin V\"ath
# Distributed under the terms of the GNU General Public License v2

EAPI=7
inherit readme.gentoo-r1 systemd
RESTRICT="mirror" # until available on gentoo mirrors

DESCRIPTION="Scripts to support compressed swap devices or ramdisks with zram"
HOMEPAGE="https://github.com/vaeth/zram-init/"
SRC_URI="https://github.com/vaeth/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~ppc ~ppc64 ~x86"
IUSE="nls split-usr"
LINGUAS="de fr"
for i in ${LINGUAS}; do
	IUSE="l10n_${i} ${IUSE}"
done

BDEPEND="nls? ( sys-devel/gettext )"
RDEPEND=">=app-shells/push-2.0-r2
	!<sys-apps/openrc-0.13
	nls? ( virtual/libintl )"

DISABLE_AUTOFORMATTING="true"
DOC_CONTENTS="To use zram, activate it in your kernel and add it to default runlevel:
	rc-config add zram default
If you use systemd enable zram_swap, tmp, and/or var_tmp with systemctl.
You might need to modify /etc/modprobe.d/zram.conf"

src_compile() {
	SHEBANG="#!${EPREFIX}$(get_usr)/bin/sh" \
		make MODIFY_SHEBANG=$(usex prefix FALSE TRUE) \
			GETTEXT=$(usex nls TRUE FALSE)
}

src_install() {
	local i po
	po=
	for i in ${LINGUAS}; do
		eval use "l10n_${i}" && po=${po}${po:+\ }i18n/${i}.po
	done
	make DESTDIR="${D}" \
		PREFIX=/usr BINDIR="${ED}$(get_usr)/sbin" SYSCONFDIR="${EPREFIX}/etc" \
		OPENRC=FALSE SYSTEMD=FALSE MANPAGE=FALSE \
		GETTEXT=$(usex nls TRUE FALSE) PO="${po}" \
		install
	doinitd openrc/init.d/*
	doconfd openrc/conf.d/*
	systemd_dounit systemd/system/*
	doman man/*
	dodoc AUTHORS ChangeLog README.md
	readme.gentoo_create_doc
}

pkg_postinst() {
	readme.gentoo_print_elog
}

get_usr() {
	use split-usr || echo /usr
}
