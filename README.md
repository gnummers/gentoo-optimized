# optimized-gentoo

My attempt at an optimized gentoo configuration, including LTO, Graphite, customized cflags, etc

With credit to: https://github.com/InBetweenNames/gentooLTO

'emerge --info' output:

Portage 2.3.100 (python 3.8.3-final-0, default/linux/amd64/17.1/systemd, gcc-11.0.0, glibc-2.31-r3, 5.4.36 x86_64)
=================================================================
System uname: Linux-5.4.36-x86_64-AMD_Ryzen_5_3600_6-Core_Processor-with-glibc2.2.5
KiB Mem:    65821220 total,  49090164 free
KiB Swap:          0 total,         0 free
Timestamp of repository gentoo: Wed, 03 Jun 2020 15:35:34 +0000
Head commit of repository gentoo: 7e201fcacd871f8681d80403ffb62b498076efff

Timestamp of repository FireBurn: Tue, 02 Jun 2020 12:35:03 +0000
Head commit of repository FireBurn: f730c7ebe48fbceeb6efdcce1af6c96e36eff0ae

Timestamp of repository R_Overlay: Wed, 03 Jun 2020 05:35:09 +0000
Head commit of repository R_Overlay: a1911814ccab5c1e39b64d7b4ef77d8bcee3f3d6

Timestamp of repository ag-ops: Mon, 01 Jun 2020 06:08:15 +0000
Head commit of repository ag-ops: 96c95641ab2876734be45107dc70b86acde1c61a

Timestamp of repository ago: Wed, 03 Jun 2020 08:05:32 +0000
Head commit of repository ago: b4e6296b49298527470d30a8afdf1697f53eca1b

Timestamp of repository aluco: Mon, 25 May 2020 21:49:28 +0000
Head commit of repository aluco: a0017b94f0707d1126c3bd4dce3457b801503f2e

Timestamp of repository apurkrt: Mon, 25 May 2020 21:51:10 +0000
Head commit of repository apurkrt: 59942d72ced02d19025938cc6882f58dfa95f7bd

Timestamp of repository archenroot: Mon, 01 Jun 2020 06:08:22 +0000
Head commit of repository archenroot: 3b52b1cf9f6708b6c2d913d13e4ef5c7614ae5d3

Timestamp of repository audio-overlay: Mon, 01 Jun 2020 06:08:10 +0000
Head commit of repository audio-overlay: d11bb7efd4b06e17092015149f25f30504baf845

Timestamp of repository awesome: Mon, 01 Jun 2020 06:07:33 +0000
Head commit of repository awesome: ba0ca228da0fa09c8093d012dfafbbf07aa29cd5

Timestamp of repository bitcoin: Mon, 01 Jun 2020 06:07:33 +0000
Head commit of repository bitcoin: 5b0caecb87c697a632c8527652bf47fc9a32ff68

Timestamp of repository bleeding-edge: Mon, 25 May 2020 21:49:33 +0000
Head commit of repository bleeding-edge: e4d97fde69ab8b15221824362eab1b3fe55a6083

Timestamp of repository brave-overlay: Thu, 28 May 2020 17:35:10 +0000
Head commit of repository brave-overlay: c959ffd517be397132787390a9cf3f8561d0ffa6

Timestamp of repository cg: Mon, 01 Jun 2020 06:07:58 +0000
Head commit of repository cg: 603fd29a21f8a516bbaad0fb237c921ace333461

Timestamp of repository crossdev: Mon, 25 May 2020 21:50:18 +0000
Head commit of repository crossdev: 9e28aaa1563792892a65a4d020eeebdee31b7228

Timestamp of repository decent-im: Mon, 01 Jun 2020 06:08:11 +0000
Head commit of repository decent-im: 973e8807f12d2ef752e8f841f88e8bbc398069ea

Timestamp of repository dlang: Sat, 30 May 2020 17:05:09 +0000
Head commit of repository dlang: 18fdc86d9fa49cd2e8d44d0e02b957882496baf6

Timestamp of repository docker: Mon, 25 May 2020 21:49:37 +0000
Head commit of repository docker: f1f06e8d9f87dd459ce55a62d2b30728343e6b29

Timestamp of repository dotnet: Mon, 01 Jun 2020 06:07:37 +0000
Head commit of repository dotnet: 4796a6c2583641d8f4b28f875cfefccebf4c8e2d

Timestamp of repository drdim: Mon, 25 May 2020 21:49:37 +0000
Head commit of repository drdim: 52ec7b0bed600b5425aa0714ffc2b22a1fcd2a09

Timestamp of repository edgets: Wed, 27 May 2020 11:36:57 +0000
Head commit of repository edgets: 13d2af158b71ffebacc882d6f32790da41931e4f

Timestamp of repository ethereum: Mon, 25 May 2020 21:51:13 +0000
Head commit of repository ethereum: c8c5b56e281172052c09252f200003c075973267

Timestamp of repository ext-devlibs: Mon, 01 Jun 2020 06:07:37 +0000
Head commit of repository ext-devlibs: bcaa7136cae91f69e8ca50066060d7d4a1a6525c

Timestamp of repository fordfrog: Mon, 25 May 2020 21:49:41 +0000
Head commit of repository fordfrog: 864f09187c77955cacddffb50dca334417b440ed

Timestamp of repository gitlab: Thu, 28 May 2020 07:05:13 +0000
Head commit of repository gitlab: d0e687ec65080d96eb42aa993f0d58cc004603da

Timestamp of repository gnome: Mon, 01 Jun 2020 06:07:38 +0000
Head commit of repository gnome: 2158d080b91a18fc9385d5008c15893cba234ccf

Timestamp of repository go-overlay: Tue, 02 Jun 2020 09:05:09 +0000
Head commit of repository go-overlay: 4848ef731ac7848305b96e33cee216905c26845b

Timestamp of repository graaff: Tue, 02 Jun 2020 05:35:03 +0000
Head commit of repository graaff: aa2ef9ee015979c5fbd4058ba5a0d9ccb0a1715e

Timestamp of repository haskell: Mon, 01 Jun 2020 22:05:06 +0000
Head commit of repository haskell: f957ee973b8a3d6a3d3bb1fa772ed54ee862df31

Timestamp of repository hexedit-overlay: Mon, 25 May 2020 21:50:26 +0000
Head commit of repository hexedit-overlay: 8134c942c5a30e50ddc28f7697d7fdbd5165b934

Timestamp of repository imaging: Mon, 25 May 2020 21:50:27 +0000
Head commit of repository imaging: 2b94452ff2e99dc19a3b6271f22d55631e7f647d

Timestamp of repository java: Mon, 01 Jun 2020 06:07:41 +0000
Head commit of repository java: 57148938801009df22b8a0c9af3db09ca090a974

Timestamp of repository junkdrawer: Mon, 01 Jun 2020 06:07:57 +0000
Head commit of repository junkdrawer: 1765af8de4534162e519e47845f1780f863a6b20

Timestamp of repository kde: Tue, 02 Jun 2020 14:35:04 +0000
Head commit of repository kde: ed4575cbc763af9f6be73abc65536d22349886ea

Timestamp of repository linuxunderground-overlay: Mon, 01 Jun 2020 06:08:14 +0000
Head commit of repository linuxunderground-overlay: 1967f50213cf3994b9f23d5df8a185f9e4fd7536

Timestamp of repository lto-overlay: Sat, 30 May 2020 15:05:02 +0000
Head commit of repository lto-overlay: e47925a5f48b7db4787c9954c7f10a36eea79f61

Timestamp of repository lua: Mon, 25 May 2020 21:49:52 +0000
Head commit of repository lua: e12f7948fd9088039822c335c24a7d35613bb17f

Timestamp of repository matrix: Fri, 29 May 2020 21:35:07 +0000
Head commit of repository matrix: bf144aa6160f3510cd6bffd001125988014c8e4e

Timestamp of repository megacoffee: Mon, 01 Jun 2020 12:35:03 +0000
Head commit of repository megacoffee: 2a6f7e7daa663b62a27819703693f4bb9b9a0440

Timestamp of repository mozilla: Thu, 28 May 2020 12:05:20 +0000
Head commit of repository mozilla: afecb2ea12c8a726aea9bccc8e2ef70984b1a9a1

Timestamp of repository multilib-portage: Mon, 01 Jun 2020 06:07:45 +0000
Head commit of repository multilib-portage: 11243e515af9b17fbc3e0144adb436cdeb2c7e8d

Timestamp of repository mv: Mon, 01 Jun 2020 13:08:39 +0000
Head commit of repository mv: bf9fb2dee5d4051f2c9db06ff53aa9be792ef063

Timestamp of repository mysql: Mon, 01 Jun 2020 06:07:45 +0000
Head commit of repository mysql: 2e54ead9b3fc37b23c04835d6dd1f34014664e38

Timestamp of repository pentoo: Wed, 03 Jun 2020 15:05:25 +0000
Head commit of repository pentoo: 492f94dd9248a0611dca928119637d616b163dd5

Timestamp of repository perl-experimental: Mon, 25 May 2020 21:49:57 +0000
Head commit of repository perl-experimental: bb376ad41d1663864d10b7deff160b4ead58c1db

Timestamp of repository plex-overlay: Wed, 03 Jun 2020 11:35:10 +0000
Head commit of repository plex-overlay: 370ee1899eaaaca67e46a6671f8de7bff1755b27

Timestamp of repository python: Mon, 25 May 2020 21:50:19 +0000
Head commit of repository python: c02d56024aeb92dc4e50aa9587b0a1b6baff3107

Timestamp of repository qgp: Mon, 01 Jun 2020 06:08:19 +0000
Head commit of repository qgp: b796d8634b730a5b874b9ed8019794f0c9277de8

Timestamp of repository qt: Wed, 03 Jun 2020 11:05:16 +0000
Head commit of repository qt: f37db0d7be537e4dc00c1cd487747b014817e2d2

Timestamp of repository quarks: Wed, 03 Jun 2020 08:05:33 +0000
Head commit of repository quarks: b2630bb4ae078f463cc8d4ddbb46ad29a16e650f

Timestamp of repository qwin-overlay: Thu, 28 May 2020 06:05:17 +0000
Head commit of repository qwin-overlay: 18a5400a6eb9d8bf60d2e24666104606d03b38ca

Timestamp of repository ricerlay: Mon, 01 Jun 2020 06:08:19 +0000
Head commit of repository ricerlay: 1d0468e5d4eecf1585c7fbee3be2350237aaeb8a

Timestamp of repository ruby: Mon, 25 May 2020 21:50:02 +0000
Head commit of repository ruby: ee6d032968c51d16b88657915fca4bfcc2110bb7

Timestamp of repository rust: Mon, 01 Jun 2020 05:35:07 +0000
Head commit of repository rust: f2d22112451eeafd51a2a4d039d626f1398ebb29

Timestamp of repository sabayon: Mon, 01 Jun 2020 06:08:26 +0000
Head commit of repository sabayon: 7ee0651ec91e68d5c5502b0a7012a5c2ad756245

Timestamp of repository science: Mon, 01 Jun 2020 06:08:26 +0000
Head commit of repository science: 1267d3414394ff4f914d5c315ed755f6dfb39b3b

Timestamp of repository scrill: Mon, 25 May 2020 21:50:05 +0000
Head commit of repository scrill: 67f7e756cd3263e6c4ba1b4c846f0cbc2a4a908a

Timestamp of repository snapd: Mon, 25 May 2020 21:51:07 +0000
Head commit of repository snapd: 6bc25838ad40929753cff5363ac30350b9865ab3

Timestamp of repository soltys: Wed, 03 Jun 2020 08:05:38 +0000
Head commit of repository soltys: ac498a25ddd99b2c163050c656fc9aaf19d2aadc

Timestamp of repository steam-overlay: Mon, 01 Jun 2020 06:07:52 +0000
Head commit of repository steam-overlay: 45bd91ee3533a6273e54a353cee59cc8c2931d44

Timestamp of repository toolchain: Sat, 22 Feb 2020 10:05:46 +0000
Head commit of repository toolchain: 523f25097ac0d12a0629aeee6cc06073949f9ae1

Timestamp of repository torbrowser: Wed, 03 Jun 2020 09:35:02 +0000
Head commit of repository torbrowser: c3cece1ed63f8b71c20ad9f22c1eb238f8cef68b

Timestamp of repository webos: Mon, 25 May 2020 21:50:14 +0000
Head commit of repository webos: a43df24314b324d960d65213e4976ae3631327f6

Timestamp of repository what4-java: Mon, 25 May 2020 21:50:59 +0000
Head commit of repository what4-java: 881c684daf41cb732fa69152acc8b3d76dc1ed5d

Timestamp of repository x11: Mon, 25 May 2020 21:50:15 +0000
Head commit of repository x11: e2ca80c79dde62920f4cee0a91edf835ce4cff2c

Timestamp of repository yoreek: Mon, 25 May 2020 21:50:15 +0000
Head commit of repository yoreek: 5ef3b47fd5fe27826f8a1fa8f2b4cf62490e56cf

sh bash 5.0_p17
ld GNU ld (Gentoo 2.34 p4) 2.34.0
ccache version 3.7.9 [disabled]
app-shells/bash:          5.0_p17::gentoo
dev-java/java-config:     2.2.0-r4::gentoo
dev-lang/perl:            5.30.3::gentoo
dev-lang/python:          2.7.18-r100::lto-overlay, 3.6.10-r2::lto-overlay, 3.7.7-r3::lto-overlay, 3.8.3-r1::lto-overlay, 3.9.0_beta1-r1::lto-overlay
dev-util/ccache:          3.7.9::gentoo
dev-util/cmake:           3.17.3::gentoo
dev-util/pkgconfig:       0.29.2::gentoo
sys-apps/baselayout:      2.7::gentoo
sys-apps/sandbox:         2.20::gentoo
sys-devel/autoconf:       2.69-r5::gentoo
sys-devel/automake:       1.16.2::gentoo
sys-devel/binutils:       2.34-r1::gentoo
sys-devel/gcc:            8.4.0-r1::gentoo, 11.0.0_pre9999::x-portage
sys-devel/gcc-config:     9999::gentoo
sys-devel/libtool:        2.4.6-r6::gentoo
sys-devel/make:           4.3::gentoo
sys-kernel/linux-headers: 5.7::gentoo (virtual/os-headers)
sys-libs/glibc:           2.31-r3::gentoo
Repositories:

gentoo
    location: /usr/portage
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/gentoo.git
    priority: -1000
    sync-git-verify-commit-signature: true
    sync-git-clone-extra-opts: -b master

FireBurn
    location: /var/db/repos/FireBurn
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/FireBurn.git
    masters: gentoo

R_Overlay
    location: /var/db/repos/R_Overlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/R_Overlay.git
    masters: gentoo

ag-ops
    location: /var/db/repos/ag-ops
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/ag-ops.git
    masters: gentoo

ago
    location: /var/db/repos/ago
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/ago.git
    masters: gentoo

aluco
    location: /var/db/repos/aluco
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/aluco.git
    masters: gentoo

apurkrt
    location: /var/db/repos/apurkrt
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/apurkrt.git
    masters: gentoo

archenroot
    location: /var/db/repos/archenroot
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/archenroot.git
    masters: gentoo

audio-overlay
    location: /var/db/repos/audio-overlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/audio-overlay.git
    masters: gentoo

awesome
    location: /var/db/repos/awesome
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/awesome.git
    masters: gentoo

bitcoin
    location: /var/db/repos/bitcoin
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/bitcoin.git
    masters: gentoo

bleeding-edge
    location: /var/db/repos/bleeding-edge
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/bleeding-edge.git
    masters: gentoo

brave-overlay
    location: /var/db/repos/brave-overlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/brave-overlay.git
    masters: gentoo

cg
    location: /var/db/repos/cg
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/cg.git
    masters: gentoo

crossdev
    location: /var/db/repos/crossdev
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/crossdev.git
    masters: gentoo

decent-im
    location: /var/db/repos/decent-im
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/decent-im.git
    masters: gentoo

dlang
    location: /var/db/repos/dlang
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/dlang.git
    masters: gentoo

docker
    location: /var/db/repos/docker
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/docker.git
    masters: gentoo

dotnet
    location: /var/db/repos/dotnet
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/dotnet.git
    masters: gentoo

drdim
    location: /var/db/repos/drdim
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/drdim.git
    masters: gentoo

edgets
    location: /var/db/repos/edgets
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/edgets.git
    masters: gentoo

ethereum
    location: /var/db/repos/ethereum
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/ethereum.git
    masters: gentoo

ext-devlibs
    location: /var/db/repos/ext-devlibs
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/ext-devlibs.git
    masters: gentoo

fordfrog
    location: /var/db/repos/fordfrog
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/fordfrog.git
    masters: gentoo

gitlab
    location: /var/db/repos/gitlab
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/gitlab.git
    masters: gentoo

gnome
    location: /var/db/repos/gnome
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/gnome.git
    masters: gentoo

go-overlay
    location: /var/db/repos/go-overlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/go-overlay.git
    masters: gentoo

graaff
    location: /var/db/repos/graaff
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/graaff.git
    masters: gentoo

haskell
    location: /var/db/repos/haskell
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/haskell.git
    masters: gentoo

hexedit-overlay
    location: /var/db/repos/hexedit-overlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/hexedit-overlay.git
    masters: gentoo

imaging
    location: /var/db/repos/imaging
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/imaging.git
    masters: gentoo

java
    location: /var/db/repos/java
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/java.git
    masters: gentoo

junkdrawer
    location: /var/db/repos/junkdrawer
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/junkdrawer.git
    masters: dlang gentoo

kde
    location: /var/db/repos/kde
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/kde.git
    masters: gentoo

linuxunderground-overlay
    location: /var/db/repos/linuxunderground-overlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/linuxunderground-overlay.git
    masters: gentoo

lto-overlay
    location: /var/db/repos/lto-overlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/lto-overlay.git
    masters: gentoo mv

lua
    location: /var/db/repos/lua
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/lua.git
    masters: gentoo

matrix
    location: /var/db/repos/matrix
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/matrix.git
    masters: gentoo

megacoffee
    location: /var/db/repos/megacoffee
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/megacoffee.git
    masters: gentoo go-overlay

mozilla
    location: /var/db/repos/mozilla
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/mozilla.git
    masters: gentoo

multilib-portage
    location: /var/db/repos/multilib-portage
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/multilib-portage.git
    masters: gentoo

mv
    location: /var/db/repos/mv
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/mv.git
    masters: gentoo

mysql
    location: /var/db/repos/mysql
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/mysql.git
    masters: gentoo

pentoo
    location: /var/db/repos/pentoo
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/pentoo.git
    masters: gentoo

perl-experimental
    location: /var/db/repos/perl-experimental
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/perl-experimental.git
    masters: gentoo

plex-overlay
    location: /var/db/repos/plex-overlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/plex-overlay.git
    masters: gentoo

python
    location: /var/db/repos/python
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/python.git
    masters: gentoo

qgp
    location: /var/db/repos/qgp
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/qgp.git
    masters: gentoo

qt
    location: /var/db/repos/qt
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/qt.git
    masters: gentoo

quarks
    location: /var/db/repos/quarks
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/quarks.git
    masters: gentoo

qwin-overlay
    location: /var/db/repos/qwin-overlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/qwin-overlay.git
    masters: gentoo

ricerlay
    location: /var/db/repos/ricerlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/ricerlay.git
    masters: gentoo

ruby
    location: /var/db/repos/ruby
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/ruby.git
    masters: gentoo

rust
    location: /var/db/repos/rust
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/rust.git
    masters: gentoo

sabayon
    location: /var/db/repos/sabayon
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/sabayon.git
    masters: gentoo

science
    location: /var/db/repos/science
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/science.git
    masters: gentoo

scrill
    location: /var/db/repos/scrill
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/scrill.git
    masters: gentoo

snapd
    location: /var/db/repos/snapd
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/snapd.git
    masters: gentoo

soltys
    location: /var/db/repos/soltys
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/soltys.git
    masters: gentoo

steam-overlay
    location: /var/db/repos/steam-overlay
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/steam-overlay.git
    masters: gentoo

toolchain
    location: /var/db/repos/toolchain
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/toolchain.git
    masters: gentoo

torbrowser
    location: /var/db/repos/torbrowser
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/torbrowser.git
    masters: gentoo

webos
    location: /var/db/repos/webos
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/webos.git
    masters: gentoo

what4-java
    location: /var/db/repos/what4-java
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/what4-java.git
    masters: gentoo

x-portage
    location: /usr/local/portage
    masters: gentoo
    priority: 0

x11
    location: /var/db/repos/x11
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/x11.git
    masters: gentoo

yoreek
    location: /var/db/repos/yoreek
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/yoreek.git
    masters: gentoo

ACCEPT_KEYWORDS="amd64 ~amd64"
ACCEPT_LICENSE="*"
CBUILD="x86_64-pc-linux-gnu"
CFLAGS="-march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
CHOST="x86_64-pc-linux-gnu"
CONFIG_PROTECT="/etc /usr/share/config /usr/share/gnupg/qualified.txt"
CONFIG_PROTECT_MASK="/etc/ca-certificates.conf /etc/dconf /etc/env.d /etc/fonts/fonts.conf /etc/gconf /etc/gentoo-release /etc/php/apache2-php7.4/ext-active/ /etc/php/cgi-php7.4/ext-active/ /etc/php/cli-php7.4/ext-active/ /etc/revdep-rebuild /etc/sandbox.d /etc/terminfo /etc/texmf/language.dat.d /etc/texmf/language.def.d /etc/texmf/updmap.d /etc/texmf/web2c"
CXXFLAGS="-march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
DISTDIR="/usr/portage/distfiles"
EMERGE_DEFAULT_OPTS="--keep-going n --quiet-fail n --binpkg-respect-use y"
ENV_UNSET="DBUS_SESSION_BUS_ADDRESS DISPLAY GOBIN PERL5LIB PERL5OPT PERLPREFIX PERL_CORE PERL_MB_OPT PERL_MM_OPT XAUTHORITY XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_RUNTIME_DIR"
FCFLAGS="-march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
FEATURES="assume-digests binpkg-docompress binpkg-dostrip binpkg-logs binpkg-multi-instance buildpkg cgroup compress-index config-protect-if-modified distlocks fixlafiles ipc-sandbox merge-sync multilib-strict network-sandbox news nodoc parallel-fetch parallel-install pid-sandbox preserve-libs qa-unresolved-soname-deps sandbox sfperms strict strict-keepdir unknown-features-warn unmerge-logs unmerge-orphans userfetch userpriv usersandbox usersync xattr"
FFLAGS="-march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
GENTOO_MIRRORS="https://ftp.fau.de/gentoo"
LANG="en_US.UTF-8"
LDFLAGS="-march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -Wl,-O4,--sort-common,--as-needed,-z,norelro,-z,now,-lgomp,-lpthread -s"
LINGUAS="en en_US"
MAKEOPTS="-j12 -l12"
PKGDIR="/usr/portage/packages"
PORTAGE_BINHOST="http://packages.gentooexperimental.org/packages/amd64-unstable/"
PORTAGE_BUNZIP2_COMMAND="pbunzip2"
PORTAGE_BZIP2_COMMAND="pbzip2"
PORTAGE_COMPRESS="pbzip2"
PORTAGE_COMPRESS_FLAGS="-9"
PORTAGE_CONFIGROOT="/"
PORTAGE_RSYNC_OPTS="--recursive --links --safe-links --perms --times --omit-dir-times --compress --force --whole-file --delete --stats --human-readable --timeout=180 --exclude=/distfiles --exclude=/local --exclude=/packages --exclude=/.git"
PORTAGE_TMPDIR="/tmp"
USE="X a52 aac acl acpi alsa amd64 asm avx bash-completion bcache berkdb blksha1 boost branding bzip2 cairo caps ccache cdda cdr cli contrib corefonts crypt curl custom-cflags custom-optimization custom-tune cxx daemon dbus dev-libs device-mapper dhcpcd dmraid dri dri3 dts eclipse emboss encode eselect examples exif expat fbcon ffmpeg flac flambda fontconfig fortran fpm gcrypt gd gdbm gif git glamor gmp go gold gpm graphite gstreamer gtk gtk3 gtk4 guile gzip handbook hddtemp hscolour hwloc iconv icu idn infinality initramfs inotify jemalloc jit jpeg jpeg2k jsonc lame latex lcms ldap libnotify libsamplerate libssh libtirpc lm-sensors lm_sensors lock lrzip lto lv4 lz4 lzma lzo mad matroska mdadm mime mmap mmx mmxext mng mono mp3 mp4 mpeg mpi multilib multitarget ncurses networkmanager nlopt nptl nscd nvidia offensive offload ogg oil openal opencl opengl openmp optimizations optimize orc override-flagomatic pam pango pch pclmul pcre pdf perl pgo pic png policykit popcnt ppds profile profiler profiling pulseaudio pypy3 python qt5 rar rdesktop readline resize-optimization ruby sasl sctp sdl seccomp session smp sndfile snmp sockets socks5 sound source spell split-usr sqlite ssh ssl startup-notification svg syslog system-bzip2 system-harfbuzz system-icu system-jpeg system-libevent system-libvpx system-libwebp system-lua system-sqlite system-zlib systemd systemtap szip tcl tcmalloc tcpd telemetry text theora threads thunar tidy tiff tk tools truetype twolame udev udisks unicode unzip upnp upnp-av upower usr-portage util utils uvm vaapi vdo vdpau vhosts vim vim-syntax vnc vorbis vpx vulkan webkit webp webui wmf wxwidgets x264 x265 xattr xcb xcomposite xface xft xine xinetd xla xml xmlrpc xmpp xorg xpm xscreensaver xv xvid xz zeroconf zip zlib zsh zsh-completion zstd" ABI_X86="64" ADA_TARGET="gnat_2018" ALSA_CARDS="hda-intel nvidia nv" APACHE2_MODULES="authn_core authz_core socache_shmcb unixd actions alias auth_basic authn_alias authn_anon authn_dbm authn_default authn_file authz_dbm authz_default authz_groupfile authz_host authz_owner authz_user autoindex cache cgi cgid dav dav_fs dav_lock deflate dir disk_cache env expires ext_filter file_cache filter headers include info log_config logio mem_cache mime mime_magic negotiation rewrite setenvif speling status unique_id userdir usertrack vhost_alias" CALLIGRA_FEATURES="karbon sheets words" COLLECTD_PLUGINS="df interface irq load memory rrdtool swap syslog" CPU_FLAGS_X86="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sha sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3" ELIBC="glibc" GPSD_PROTOCOLS="ashtech aivdm earthmate evermore fv18 garmin garmintxt gpsclock greis isync itrax mtk3301 nmea ntrip navcom oceanserver oldstyle oncore rtcm104v2 rtcm104v3 sirf skytraq superstar2 timing tsip tripmate tnt ublox ubx" GRUB_PLATFORMS="pc efi-64" INPUT_DEVICES="keyboard mouse evdev libinput" KERNEL="linux" L10N="en en_US en-US" LCD_DEVICES="bayrad cfontz cfontz633 glk hd44780 lb216 lcdm001 mtxorb ncurses text" LIBREOFFICE_EXTENSIONS="presenter-console presenter-minimizer" LLVM_TARGETS="AMDGPU BPF NVPTX X86 AArch64 ARM WebAssembly XCore" NGINX_MODULES_HTTP="access fastcgi gzip proxy rewrite" OFFICE_IMPLEMENTATION="libreoffice" PHP_TARGETS="php7-2" POSTGRES_TARGETS="postgres10 postgres11" PYTHON_SINGLE_TARGET="python3_8" PYTHON_TARGETS="python3_8 python3_9 python3_7 python3_6 python2_7 pypy3" QEMU_SOFTMMU_TARGETS="x86_64 aarch64 arm" QEMU_USER_TARGETS="x86_64 aarch64 arm" RUBY_TARGETS="ruby27 ruby26 ruby25" USERLAND="GNU" VIDEO_CARDS="nv nvidia vesa fbdev nouveau dummy v4l" XTABLES_ADDONS="quota2 psd pknock lscan length2 ipv4options ipset ipp2p iface geoip fuzzy condition tee tarpit sysrq steal rawnat logmark ipmark dhcpmac delude chaos account"
Unset:  CC, CPPFLAGS, CTARGET, CXX, INSTALL_MASK, LC_ALL, PORTAGE_RSYNC_EXTRA_OPTS

