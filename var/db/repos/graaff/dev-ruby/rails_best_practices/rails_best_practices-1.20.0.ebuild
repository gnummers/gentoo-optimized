# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"

RUBY_FAKEGEM_RECIPE_TEST="rspec3"

RUBY_FAKEGEM_EXTRAINSTALL="assets rails_best_practices.yml"

inherit ruby-fakegem

DESCRIPTION="a gem to check quality of rails app files"
HOMEPAGE="https://wiki.github.com/flyerhzm/rails_best_practices"
LICENSE="MIT"

KEYWORDS="~amd64"
SLOT="0"
IUSE=""

ruby_add_bdepend "test? ( dev-ruby/rspec:2 dev-ruby/haml )"

ruby_add_rdepend "
	dev-ruby/activesupport:*
	>=dev-ruby/code_analyzer-0.5.1
	dev-ruby/erubis
	dev-ruby/i18n:*
	dev-ruby/json:*
	dev-ruby/require_all:3
	dev-ruby/ruby-progressbar"

all_ruby_prepare() {
	sed -i -e '/[Bb]undler/d' Rakefile || die
	rm Gemfile || die

	sed -i -e '/coverall/I d' spec/spec_helper.rb || die

	# Avoid slim specs since we don't have that available.
	sed -i -e '/should law of demeter with slim/,/end/ s:^:#:' spec/rails_best_practices/reviews/law_of_demeter_review_spec.rb || die
	sed -i -e '/should move code into model with slim/,/end/ s:^:#:' spec/rails_best_practices/reviews/move_code_into_model_review_spec.rb || die
	sed -i -e '/local varialbe in slim file/,/end/ s:^:#:' spec/rails_best_practices/reviews/replace_instance_variable_with_local_variable_review_spec.rb || die
}
