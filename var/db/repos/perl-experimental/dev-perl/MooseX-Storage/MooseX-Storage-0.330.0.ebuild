# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
MODULE_AUTHOR=ETHER
MODULE_VERSION=0.33
inherit perl-module

DESCRIPTION='A serialization framework for Moose classes'
LICENSE=" || ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
perl_meta_configure() {
	# ExtUtils::MakeMaker 6.36 ( 6.360.0 )
	echo \>=virtual/perl-ExtUtils-MakeMaker-6.36
}
perl_meta_build() {
	# ExtUtils::MakeMaker 6.36 ( 6.360.0 )
	echo \>=virtual/perl-ExtUtils-MakeMaker-6.36
	# Test::Deep
	echo dev-perl/Test-Deep
	# Test::Fatal
	echo dev-perl/Test-Fatal
	# Test::More 0.88 ( 0.880.0 )
	echo \>=virtual/perl-Test-Simple-0.880.0
	# Test::Requires 0.05 ( 0.50.0 )
	echo \>=dev-perl/Test-Requires-0.50.0
}
perl_meta_runtime() {
	# Moose 0.99 ( 0.990.0 )
	echo \>=dev-perl/Moose-0.990.0
	# String::RewritePrefix
	echo dev-perl/String-RewritePrefix
}
DEPEND="
	$(perl_meta_configure)
	$(perl_meta_build)
	$(perl_meta_runtime)
"
RDEPEND="
	$(perl_meta_runtime)
"
SRC_TEST="do"
