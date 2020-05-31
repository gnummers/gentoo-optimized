#!/bin/bash

# don't allow to host web applications as root
if [ $EUID -eq 0 ]; then
	echo "Denying attempt to run Kallithea as root." >&2
	exit 1
fi

# get full + virtual environment
source /etc/profile
source /opt/kallithea/bin/activate

# start Kallithea
cd /var/lib/kallithea
paster serve    --pid-file=/run/kallithea.pid \
                --log-file=/var/log/kallithea/kallithea.log \
                --daemon \
                /etc/kallithea/production.ini
