# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5
MODULE_AUTHOR=TSIBLEY
MODULE_VERSION=0.16
inherit perl-module

DESCRIPTION='read-eval-print-loop on die and/or warn'
LICENSE=" || ( Artistic GPL-2 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""
perl_meta_configure() {
	# ExtUtils::MakeMaker 6.59 ( 6.590.0 )
	echo \>=virtual/perl-ExtUtils-MakeMaker-6.590.0
}
perl_meta_build() {
	# ExtUtils::MakeMaker 6.59 ( 6.590.0 )
	echo \>=virtual/perl-ExtUtils-MakeMaker-6.590.0
	# Test::Expect
	echo dev-perl/Test-Expect
	# Test::More
	echo virtual/perl-Test-Simple
}
perl_meta_runtime() {
	# Data::Dump::Streamer
	echo dev-perl/Data-Dump-Streamer
	# Devel::LexAlias
	echo dev-perl/Devel-LexAlias
	# Devel::REPL
	echo dev-perl/Devel-REPL
	# Devel::StackTrace::WithLexicals
	echo dev-perl/Devel-StackTrace-WithLexicals
	# Lexical::Persistence
	echo dev-perl/Lexical-Persistence
	# namespace::clean
	echo dev-perl/namespace-clean
	# perl v5.6.0 ( 5.6.0 )
	echo \>=dev-lang/perl-5.6.0
}
DEPEND="
	$(perl_meta_configure)
	$(perl_meta_build)
	$(perl_meta_runtime)
"
RDEPEND="
	$(perl_meta_runtime)
"
SRC_TEST="do parallel"
