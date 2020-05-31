#!/sbin/runscript
# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

depend() {
	need net
}

start() {
	ebegin "Starting udpxy"
	start-stop-daemon --start --exec /usr/bin/udpxy -- ${UDPXYOPTS}
	eend $?
}

stop() {
	ebegin "Stopping udpxy"
	start-stop-daemon --stop --exec /usr/bin/udpxy
	eend $?
}
