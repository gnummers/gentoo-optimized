#!/bin/bash

# Copyright (C) <2012>  Jory A. Pratt, < anarchy [at] gentoo [dot] org>

#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.

#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.

#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

# This file is only intended to generate a shared db for nss
# in the users home dir. This will be the first step in creating
# a database that can be shared amongs applications using the sql
# backend.

PASSWD_FILE="$(pwd)/nssdb_passwd"

mkdir -p $HOME/.pki/nssdb 

certutil -N -f ${PASSWD_FILE} -d sql:${HOME}/.pki/nssdb

for x in `ls /etc/ssl/certs | grep pem`; do
	certutil -f ${PASSWD_FILE} -d sql:${HOME}/.pki/nssdb -A -t "CT,c,c" -n $x -i /etc/ssl/certs/$x
done

echo "Please also ensure you add 'export NSS_DEFAULT_DB_TYPE=\"sql\"' via $HOME/.bashrc"
echo "To see a list of all certificate you may run, 'certutil -L -d $HOME/.pki/nssdb,'"
