# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="ENV ENV2 History.txt README.txt RULES"

# There are specs but they require an old version of rspec.
RUBY_FAKEGEM_TASK_TEST=""

RUBY_FAKEGEM_EXTRAINSTALL="config"

inherit ruby-fakegem

DESCRIPTION="Inspect and process video or audio files."
HOMEPAGE="https://github.com/zencoder/rvideo/issues"
LICENSE="MIT"

KEYWORDS="~amd64 ~x86 ~x86-macos"
SLOT="0"
IUSE="doc"

RUBY_PATCHES=( rvideo-ffmpeg.patch rvideo-output-encoding.patch )
