#!/sbin/openrc-run
# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License, v2 or later
# $Header:

start() {
	ebegin "Starting Logkeys"

	start-stop-daemon \
		--start \
		--pidfile /run/logkeys.pid \
		--exec /usr/bin/logkeys -- -s ${LOGKEYS_ARGS}
	eend $?
}

stop() {
	ebegin "Stopping Logkeys"
	start-stop-daemon --stop --pidfile /run/logkeys.pid
	eend $?
}
