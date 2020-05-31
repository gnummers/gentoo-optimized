# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit acct-user

DESCRIPTION="System-wide Lightning services user"
ACCT_USER_ID=-1
ACCT_USER_HOME=/var/lib/lightning
ACCT_USER_HOME_PERMS=0750
ACCT_USER_GROUPS=( lightning )

acct-user_add_deps
