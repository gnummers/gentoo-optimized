# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

MY_P=${P/firmware/fw}

DESCRIPTION="Firmware for TBS DTV devices"
HOMEPAGE="https://www.tbsdtv.com/"
SRC_URI="https://www.tbsdtv.com/download/document/linux/tbs-tuner-firmwares_v${PV}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="sys-kernel/linux-firmware"

S="${WORKDIR}"

COLLISSION_FIRMWARE=(
	v4l-cx25840.fw
	v4l-cx23885-avcore-01.fw
	v4l-cx23418-dig.fw
	v4l-cx23418-cpu.fw
	v4l-cx23418-apu.fw
	v4l-cx231xx-avcore-01.fw
	sms1xxx-stellar-dvbt-01.fw
	sms1xxx-nova-b-dvbt-01.fw
	sms1xxx-nova-a-dvbt-01.fw
	sms1xxx-hcw-55xxx-isdbt-02.fw
	sms1xxx-hcw-55xxx-dvbt-02.fw
	dvb-usb-terratec-h5-drxk.fw
	dvb-usb-it9135-02.fw
	dvb-usb-it9135-01.fw
	dvb-usb-dib0700-1.20.fw
	dvb-fe-xc5000c-4.1.30.7.fw
	dvb-fe-xc5000-1.6.114.fw
	dvb-fe-xc4000-1.4.1.fw
)

src_install() {
	insinto /lib/firmware

	for firmware in ${COLLISSION_FIRMWARE[@]}; do
		rm -f ${firmware}
	done

	doins *.fw
}
