# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7} )
PYTHON_REQ_USE="sqlite"

inherit distutils-r1 git-r3

DESCRIPTION="Media library management system for obsessive-compulsive music geeks"
HOMEPAGE="http://beets.io/"
EGIT_REPO_URI="https://github.com/beetbox/beets.git"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="badfiles chromaprint discogs doc embedart fetchart ffmpeg gstreamer icu lastfm mpd replaygain thumbnail zsh-completion"

DEPEND="
	>=dev-python/confuse-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/mediafile-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/munkres-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-musicbrainz-ngs-0.4[${PYTHON_USEDEP}]
	>=dev-python/six-1.9[${PYTHON_USEDEP}]
	dev-python/jellyfish[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/unidecode[${PYTHON_USEDEP}]
	badfiles? (
		media-libs/flac
		media-sound/mp3val
	)
	chromaprint? (
		dev-python/pyacoustid[${PYTHON_USEDEP}]
		media-libs/chromaprint[tools]
	)
	discogs? ( >=dev-python/discogs-client-2.2.1[${PYTHON_USEDEP}] )
	doc? ( dev-python/sphinx[${PYTHON_USEDEP}] )
	embedart? (
		dev-python/pillow[${PYTHON_USEDEP}]
		media-gfx/imagemagick
	)
	fetchart? (
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
	)
	ffmpeg? ( media-video/ffmpeg:0[encode] )
	icu? ( dev-db/sqlite[icu] )
	lastfm? ( dev-python/pylast[${PYTHON_USEDEP}] )
	mpd? (
		dev-python/python-mpd[${PYTHON_USEDEP}]
		gstreamer? ( media-plugins/gst-plugins-meta:1.0 )
		dev-python/pygobject:3[${PYTHON_USEDEP}]
	)
	replaygain? (
		gstreamer? (
			dev-python/pygobject:3[${PYTHON_USEDEP}]
			media-libs/gst-plugins-good:1.0
			media-plugins/gst-plugins-meta:1.0[ffmpeg]
		)
		!gstreamer? ( media-sound/mp3gain )
	)
	thumbnail? (
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pyxdg[${PYTHON_USEDEP}]
	)
"
RDEPEND="${DEPEND}"
BDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

src_prepare() {
	rm_use_plugins() {
		[[ -n "${1}" ]] || die "rm_use_plugins: No use option given"
		local use=${1}
		local plugins=${use}
		use ${use} && return
		einfo "no ${use}:"
		[[ $# -gt 1 ]] && plugins="${@:2}"
		for arg in ${plugins[@]}; do
			einfo "  removing ${arg}"
			if [[ -e "beetsplug/${arg}.py" ]]; then
				rm beetsplug/${arg}.py || die "Unable to remove ${arg} plugin"
			fi
			if [[ -d "beetsplug/${arg}" ]]; then
				rm -r beetsplug/${arg} || die "Unable to remove ${arg} plugin"
			fi
			sed -e "s:'beetsplug.${arg}',::" -i setup.py || \
				die "Unable to disable ${arg} plugin "
		done
	}

	default

	rm_use_plugins chromaprint chroma
	rm_use_plugins ffmpeg convert
	rm_use_plugins icu loadext
	rm_use_plugins lastfm lastgenre lastimport
	rm_use_plugins mpd bpd mpdstats
	rm_use_plugins thumbnail thumbnails

	for flag in badfiles discogs embedart fetchart replaygain; do
		rm_use_plugins ${flag}
	done
}

python_compile_all() {
	use doc && emake -C docs html
}

python_install_all() {
	distutils-r1_python_install_all

	if use zsh-completion; then
		insinto /usr/share/zsh/site-functions/
		doins extra/_beet
	fi
}
