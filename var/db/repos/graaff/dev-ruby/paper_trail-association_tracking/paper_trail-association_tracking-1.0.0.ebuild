# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_RECIPE_DOC="rdoc"
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

inherit eapi7-ver ruby-fakegem

DESCRIPTION="Plugin for the PaperTrail gem to track and reify associations"
HOMEPAGE="https://github.com/westonganger/paper_trail-association_tracking"

LICENSE="MIT"
SLOT=$(ver_cut 1)
KEYWORDS="~amd64"
IUSE=""

# Now uses appraisal which we don't support yet.
RESTRICT="test"
