# optimized-gentoo

My attempt at an optimized gentoo configuration, including LTO, Graphite, customized cflags, etc

With credit to: https://github.com/InBetweenNames/gentooLTO

'emerge --info' output:

```
Portage 2.3.100 (python 3.8.3-final-0, default/linux/amd64/17.1/systemd, gcc-11.0.0, glibc-2.31-r3, 5.4.36 x86_64)

System uname: Linux-5.4.36-x86_64-AMD_Ryzen_5_3600_6-Core_Processor-with-glibc2.2.5
KiB Mem:    65821220 total,  21581088 free
KiB Swap:          0 total,         0 free

Timestamp of repository gentoo: Sat, 30 May 2020 22:37:28 +0000
Head commit of repository gentoo: e7739668cbda5fac4c5ad42d42980c1478f741e7

Timestamp of repository FireBurn: Wed, 27 May 2020 13:36:56 +0000
Head commit of repository FireBurn: 8be62411972fca7ad25ab7023b26362689aabc95

Timestamp of repository R_Overlay: Sat, 30 May 2020 05:35:16 +0000
Head commit of repository R_Overlay: 1642bc3572a090574e3576b8dd21b2c00be81353

Timestamp of repository ag-ops: Mon, 25 May 2020 21:50:55 +0000
Head commit of repository ag-ops: 92394031fb94e583da31f466d1ce5f1ff703fd3a

Timestamp of repository ago: Wed, 27 May 2020 19:35:34 +0000
Head commit of repository ago: 6ed41cd5165e242143bb0fd706f4661e6a84db95

Timestamp of repository aluco: Mon, 25 May 2020 21:49:28 +0000
Head commit of repository aluco: a0017b94f0707d1126c3bd4dce3457b801503f2e

Timestamp of repository apurkrt: Mon, 25 May 2020 21:51:10 +0000
Head commit of repository apurkrt: 59942d72ced02d19025938cc6882f58dfa95f7bd

Timestamp of repository archenroot: Mon, 25 May 2020 21:51:05 +0000
Head commit of repository archenroot: 9a86d2d158bc472dc2d8dd3d760edd4867d24e86

Timestamp of repository audio-overlay: Mon, 25 May 2020 21:50:44 +0000
Head commit of repository audio-overlay: deba6463af1bdc2e5a97c60a43b7717dafe5cd3f

Timestamp of repository awesome: Thu, 28 May 2020 07:05:13 +0000
Head commit of repository awesome: 98c645b1e749f094057bcf8d84b307e4f5ea1b58

Timestamp of repository bitcoin: Mon, 25 May 2020 21:49:33 +0000
Head commit of repository bitcoin: d6723d939f5e63f0e2ffea34b0652e2da4abe4c4

Timestamp of repository bleeding-edge: Mon, 25 May 2020 21:49:33 +0000
Head commit of repository bleeding-edge: e4d97fde69ab8b15221824362eab1b3fe55a6083

Timestamp of repository brave-overlay: Thu, 28 May 2020 17:35:10 +0000
Head commit of repository brave-overlay: c959ffd517be397132787390a9cf3f8561d0ffa6

Timestamp of repository cg: Fri, 29 May 2020 09:05:16 +0000
Head commit of repository cg: 04c8d7ad3a28f6e4df07ac12763fa4ec7c02881c

Timestamp of repository crossdev: Mon, 25 May 2020 21:50:18 +0000
Head commit of repository crossdev: 9e28aaa1563792892a65a4d020eeebdee31b7228

Timestamp of repository decent-im: Mon, 25 May 2020 21:50:48 +0000
Head commit of repository decent-im: 27abbd2ed267b24223002ae09e45133aa84c5eba

Timestamp of repository dlang: Sat, 30 May 2020 17:05:09 +0000
Head commit of repository dlang: 18fdc86d9fa49cd2e8d44d0e02b957882496baf6

Timestamp of repository docker: Mon, 25 May 2020 21:49:37 +0000
Head commit of repository docker: f1f06e8d9f87dd459ce55a62d2b30728343e6b29

Timestamp of repository dotnet: Mon, 25 May 2020 21:49:37 +0000
Head commit of repository dotnet: cc791c29e96c02bcb10cc7d1cd4337d00b54604e

Timestamp of repository drdim: Mon, 25 May 2020 21:49:37 +0000
Head commit of repository drdim: 52ec7b0bed600b5425aa0714ffc2b22a1fcd2a09

Timestamp of repository edgets: Wed, 27 May 2020 11:36:57 +0000
Head commit of repository edgets: 13d2af158b71ffebacc882d6f32790da41931e4f

Timestamp of repository ethereum: Mon, 25 May 2020 21:51:13 +0000
Head commit of repository ethereum: c8c5b56e281172052c09252f200003c075973267

Timestamp of repository ext-devlibs: Fri, 29 May 2020 09:05:08 +0000
Head commit of repository ext-devlibs: c1eb0cdc0feb0fbcbce688a666e2d21cb3d81644

Timestamp of repository fordfrog: Mon, 25 May 2020 21:49:41 +0000
Head commit of repository fordfrog: 864f09187c77955cacddffb50dca334417b440ed

Timestamp of repository gitlab: Thu, 28 May 2020 07:05:13 +0000
Head commit of repository gitlab: d0e687ec65080d96eb42aa993f0d58cc004603da

Timestamp of repository gnome: Thu, 28 May 2020 06:05:14 +0000
Head commit of repository gnome: 4122bdb1959b24e655e423f8acf940484cd7b129

Timestamp of repository go-overlay: Mon, 25 May 2020 21:50:18 +0000
Head commit of repository go-overlay: 421d7db481d5d55fe3a7567c1ea5b6befc51897d

Timestamp of repository graaff: Fri, 29 May 2020 06:09:19 +0000
Head commit of repository graaff: bc55f730fb99fd59181eb2bf8e5a1453fed5b180

Timestamp of repository haskell: Sat, 30 May 2020 01:05:08 +0000
Head commit of repository haskell: 27aaa1429a566cc8d6867b8966788569d86bdc66

Timestamp of repository hexedit-overlay: Mon, 25 May 2020 21:50:26 +0000
Head commit of repository hexedit-overlay: 8134c942c5a30e50ddc28f7697d7fdbd5165b934

Timestamp of repository imaging: Mon, 25 May 2020 21:50:27 +0000
Head commit of repository imaging: 2b94452ff2e99dc19a3b6271f22d55631e7f647d

Timestamp of repository java: Fri, 29 May 2020 09:05:10 +0000
Head commit of repository java: de3d7fb26c8c1b83fd282c9caededa116ee54d4d

Timestamp of repository junkdrawer: Fri, 29 May 2020 09:05:16 +0000
Head commit of repository junkdrawer: fc5faca14509e724b8e051e66002d60c386c53c8

Timestamp of repository kde: Sat, 30 May 2020 20:05:08 +0000
Head commit of repository kde: 7a00bc740c6654ee68ab7005a74a1e94723d1538

Timestamp of repository linuxunderground-overlay: Thu, 28 May 2020 05:35:02 +0000
Head commit of repository linuxunderground-overlay: d5cad340326cdaf93972155188431c83d82c6316

Timestamp of repository lto-overlay: Sat, 30 May 2020 15:05:02 +0000
Head commit of repository lto-overlay: e47925a5f48b7db4787c9954c7f10a36eea79f61

Timestamp of repository lua: Mon, 25 May 2020 21:49:52 +0000
Head commit of repository lua: e12f7948fd9088039822c335c24a7d35613bb17f

Timestamp of repository matrix: Fri, 29 May 2020 21:35:07 +0000
Head commit of repository matrix: bf144aa6160f3510cd6bffd001125988014c8e4e

Timestamp of repository megacoffee: Mon, 25 May 2020 21:51:08 +0000
Head commit of repository megacoffee: 414d77698f06e0a7e3308c8441599da75a043a61

Timestamp of repository mozilla: Thu, 28 May 2020 12:05:20 +0000
Head commit of repository mozilla: afecb2ea12c8a726aea9bccc8e2ef70984b1a9a1

Timestamp of repository multilib-portage: Mon, 25 May 2020 21:49:53 +0000
Head commit of repository multilib-portage: 9f442822405b08830a02cad21932d8d8022e02b4

Timestamp of repository mv: Sat, 30 May 2020 15:05:02 +0000
Head commit of repository mv: 7a29f3deb092b48a1a2ba0488e0d2fcd40a4929c

Timestamp of repository mysql: Mon, 25 May 2020 21:49:56 +0000
Head commit of repository mysql: e9b2116cfddf9a4556069dfe83638f48450479ad

Timestamp of repository pentoo: Sat, 30 May 2020 21:05:04 +0000
Head commit of repository pentoo: e400399d99b0a94744ee2b48b2699ffcb92a8117

Timestamp of repository perl-experimental: Mon, 25 May 2020 21:49:57 +0000
Head commit of repository perl-experimental: bb376ad41d1663864d10b7deff160b4ead58c1db

Timestamp of repository plex-overlay: Wed, 27 May 2020 19:05:12 +0000
Head commit of repository plex-overlay: 617007867c6e566e3bdb91a2f75df1e3bfec5f5d

Timestamp of repository python: Mon, 25 May 2020 21:50:19 +0000
Head commit of repository python: c02d56024aeb92dc4e50aa9587b0a1b6baff3107

Timestamp of repository qgp: Fri, 29 May 2020 09:05:19 +0000
Head commit of repository qgp: 3309bb0720ce0a64e5d67df64096188f62fec075

Timestamp of repository qt: Thu, 28 May 2020 07:36:29 +0000
Head commit of repository qt: 6383f2c54663858931131cb0de41c6fbc1d89b82

Timestamp of repository quarks: Wed, 27 May 2020 19:35:34 +0000
Head commit of repository quarks: 2fff7e114183ec569c9d2881f93dc746b0e7d1c0

Timestamp of repository qwin-overlay: Thu, 28 May 2020 06:05:17 +0000
Head commit of repository qwin-overlay: 18a5400a6eb9d8bf60d2e24666104606d03b38ca

Timestamp of repository ricerlay: Mon, 25 May 2020 21:51:00 +0000
Head commit of repository ricerlay: 8d1d743e0c62341346796fe5df5cc269f271d197

Timestamp of repository ruby: Mon, 25 May 2020 21:50:02 +0000
Head commit of repository ruby: ee6d032968c51d16b88657915fca4bfcc2110bb7

Timestamp of repository rust: Fri, 29 May 2020 08:08:42 +0000
Head commit of repository rust: d76e516940da8ccba0164bbbb56b625c66470624

Timestamp of repository sabayon: Fri, 29 May 2020 22:35:11 +0000
Head commit of repository sabayon: 1b0ecf6429aea7ec1d1f672c00fad01c946e42fa

Timestamp of repository science: Fri, 29 May 2020 09:05:21 +0000
Head commit of repository science: 849a1389b24f6baf82c45a958ef6c3a3c8f2ce4f

Timestamp of repository scrill: Mon, 25 May 2020 21:50:05 +0000
Head commit of repository scrill: 67f7e756cd3263e6c4ba1b4c846f0cbc2a4a908a

Timestamp of repository snapd: Mon, 25 May 2020 21:51:07 +0000
Head commit of repository snapd: 6bc25838ad40929753cff5363ac30350b9865ab3

Timestamp of repository soltys: Wed, 27 May 2020 19:35:39 +0000
Head commit of repository soltys: 1ddf6fb13c91635ac3e39cbc52b70d6023c9ab7c

Timestamp of repository steam-overlay: Mon, 25 May 2020 21:50:07 +0000
Head commit of repository steam-overlay: 901d8dffb5c2a3ff37b797e8283803c302be85da

Timestamp of repository toolchain: Sat, 22 Feb 2020 10:05:46 +0000
Head commit of repository toolchain: 523f25097ac0d12a0629aeee6cc06073949f9ae1

Timestamp of repository torbrowser: Thu, 28 May 2020 12:05:20 +0000
Head commit of repository torbrowser: 90a22c73369236f404ab8b19435f38b3cf48e25b

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
ccache version 3.7.9 [enabled]
app-shells/bash:          5.0_p17::gentoo
dev-java/java-config:     2.2.0-r4::gentoo
dev-lang/perl:            5.30.2-r2::gentoo
dev-lang/python:          2.7.18-r100::lto-overlay, 3.7.7-r3::lto-overlay, 3.8.3-r1::lto-overlay, 3.9.0_beta1-r1::lto-overlay
dev-util/ccache:          3.7.9::gentoo
dev-util/cmake:           3.17.3::gentoo
dev-util/pkgconfig:       0.29.2::gentoo
sys-apps/baselayout:      2.7::gentoo
sys-apps/sandbox:         2.18::gentoo
sys-devel/autoconf:       2.13-r1::gentoo, 2.69-r5::gentoo
sys-devel/automake:       1.16.2::gentoo
sys-devel/binutils:       2.34-r1::gentoo
sys-devel/gcc:            11.0.0_pre9999::x-portage
sys-devel/gcc-config:     9999::gentoo
sys-devel/libtool:        2.4.6-r6::gentoo
sys-devel/make:           4.3::gentoo
sys-kernel/linux-headers: 5.6::gentoo (virtual/os-headers)
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
    masters: gentoo

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
CFLAGS="-march=znver2 -O3 -fgraphite-identity -floop-nest-optimize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fno-signed-zeros -fno-trapping-math -fassociative-math -freciprocal-math -fno-math-errno -ffinite-math-only -fno-rounding-math -fno-signaling-nans -fcx-limited-range -fexcess-precision=fast -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -pipe -g0"
CHOST="x86_64-pc-linux-gnu"
CONFIG_PROTECT="/etc /usr/share/config /usr/share/gnupg/qualified.txt"
CONFIG_PROTECT_MASK="/etc/ca-certificates.conf /etc/env.d /etc/fonts/fonts.conf /etc/gconf /etc/gentoo-release /etc/php/apache2-php7.4/ext-active/ /etc/php/cgi-php7.4/ext-active/ /etc/php/cli-php7.4/ext-active/ /etc/revdep-rebuild /etc/sandbox.d /etc/terminfo /etc/texmf/language.dat.d /etc/texmf/language.def.d /etc/texmf/updmap.d /etc/texmf/web2c"
CXXFLAGS="-march=znver2 -O3 -fgraphite-identity -floop-nest-optimize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fno-signed-zeros -fno-trapping-math -fassociative-math -freciprocal-math -fno-math-errno -ffinite-math-only -fno-rounding-math -fno-signaling-nans -fcx-limited-range -fexcess-precision=fast -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -pipe -g0"
DISTDIR="/usr/portage/distfiles"
EMERGE_DEFAULT_OPTS="--with-bdeps=y --with-test-deps=y --complete-graph y --keep-going n --quiet-fail n --binpkg-respect-use y --jobs 6 --load-average 12.0"
ENV_UNSET="DBUS_SESSION_BUS_ADDRESS DISPLAY GOBIN PERL5LIB PERL5OPT PERLPREFIX PERL_CORE PERL_MB_OPT PERL_MM_OPT XAUTHORITY XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_RUNTIME_DIR"
FCFLAGS="-march=znver2 -O3 -fgraphite-identity -floop-nest-optimize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fno-signed-zeros -fno-trapping-math -fassociative-math -freciprocal-math -fno-math-errno -ffinite-math-only -fno-rounding-math -fno-signaling-nans -fcx-limited-range -fexcess-precision=fast -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -pipe -g0"
FEATURES="assume-digests binpkg-docompress binpkg-dostrip binpkg-logs binpkg-multi-instance buildpkg ccache compress-index config-protect-if-modified distlocks downgrade-backup fixlafiles ipc-sandbox merge-sync multilib-strict network-sandbox news nodoc parallel-fetch parallel-install pid-sandbox preserve-libs qa-unresolved-soname-deps sandbox sfperms strict unknown-features-warn unmerge-backup unmerge-logs unmerge-orphans userfetch userpriv usersandbox usersync xattr"
FFLAGS="-march=znver2 -O3 -fgraphite-identity -floop-nest-optimize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fno-signed-zeros -fno-trapping-math -fassociative-math -freciprocal-math -fno-math-errno -ffinite-math-only -fno-rounding-math -fno-signaling-nans -fcx-limited-range -fexcess-precision=fast -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -pipe -g0"
GENTOO_MIRRORS="https://ftp.fau.de/gentoo"
LANG="en_US.utf8"
LDFLAGS="-Wl,-O1 -Wl,--as-needed -Wl,-z,norelro -Wl,-z,now -Wl,--sort-common -s"
LINGUAS="en en_US"
MAKEOPTS="-j12 -l12"
PKGDIR="/usr/portage/packages"
PORTAGE_BINHOST="http://packages.gentooexperimental.org/packages/amd64-unstable/"
PORTAGE_CONFIGROOT="/"
PORTAGE_RSYNC_OPTS="--recursive --links --safe-links --perms --times --omit-dir-times --compress --force --whole-file --delete --stats --human-readable --timeout=180 --exclude=/distfiles --exclude=/local --exclude=/packages --exclude=/.git"
PORTAGE_TMPDIR="/tmp"
USE="X acl alsa amd64 bash-completion bcache berkdb branding bzip2 caps cli crypt curl cxx dev-libs device-mapper dhcpcd dmraid dri eselect fbcon ffmpeg fontconfig fortran gcrypt gd gdbm git gmp gold graphite gtk gtk3 gtk4 gzip hddtemp hscolour hwloc iconv infinality initramfs inotify jemalloc latex libssh libtirpc lm-sensors lrzip lto lv4 lz4 lzma lzo mdadm mmap multilib multitarget ncurses nptl nscd offensive offload openal opengl openmp pam pcre pgo png profile rar readline sctp sdl seccomp session smp snmp sockets sound source spell split-usr ssh ssl syslog systemd systemtap tcmalloc tcpd telemetry test threads tidy truetype udev udisks unicode upnp upnp-av upower usr-portage vaapi vdpau vhosts vim vim-syntax vnc x264 xattr xcb xcomposite xface xft xine xinetd xml xmlrpc xmpp xorg xpm xscreensaver xv xvid xz zeroconf zip zlib zsh zsh-completion zstd" ABI_X86="64" ADA_TARGET="gnat_2018" ALSA_CARDS="hda-intel nvidia nv" APACHE2_MODULES="authn_core authz_core socache_shmcb unixd actions alias auth_basic authn_alias authn_anon authn_dbm authn_default authn_file authz_dbm authz_default authz_groupfile authz_host authz_owner authz_user autoindex cache cgi cgid dav dav_fs dav_lock deflate dir disk_cache env expires ext_filter file_cache filter headers include info log_config logio mem_cache mime mime_magic negotiation rewrite setenvif speling status unique_id userdir usertrack vhost_alias" CALLIGRA_FEATURES="karbon sheets words" COLLECTD_PLUGINS="df interface irq load memory rrdtool swap syslog" CPU_FLAGS_X86="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sha sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3" ELIBC="glibc" GPSD_PROTOCOLS="ashtech aivdm earthmate evermore fv18 garmin garmintxt gpsclock greis isync itrax mtk3301 nmea ntrip navcom oceanserver oldstyle oncore rtcm104v2 rtcm104v3 sirf skytraq superstar2 timing tsip tripmate tnt ublox ubx" GRUB_PLATFORMS="pc efi-64" INPUT_DEVICES="keyboard mouse evdev libinput" KERNEL="linux" L10N="en en_US en-US" LCD_DEVICES="bayrad cfontz cfontz633 glk hd44780 lb216 lcdm001 mtxorb ncurses text" LIBREOFFICE_EXTENSIONS="presenter-console presenter-minimizer" LLVM_TARGETS="AMDGPU BPF NVPTX X86 AArch64 ARM WebAssembly XCore" NGINX_MODULES_HTTP="access fastcgi gzip proxy rewrite" OFFICE_IMPLEMENTATION="libreoffice" PHP_TARGETS="php7-2" POSTGRES_TARGETS="postgres10 postgres11" PYTHON_SINGLE_TARGET="python3_8" PYTHON_TARGETS="python3_8 python3_9 python3_7 python2_7 pypy3" QEMU_SOFTMMU_TARGETS="x86_64 aarch64 arm" QEMU_USER_TARGETS="x86_64 aarch64 arm" RUBY_TARGETS="ruby27 ruby26" USERLAND="GNU" VIDEO_CARDS="nv nvidia vesa fbdev nouveau" XTABLES_ADDONS="quota2 psd pknock lscan length2 ipv4options ipset ipp2p iface geoip fuzzy condition tee tarpit sysrq steal rawnat logmark ipmark dhcpmac delude chaos account"
Unset:  CC, CPPFLAGS, CTARGET, CXX, INSTALL_MASK, LC_ALL, PORTAGE_BUNZIP2_COMMAND, PORTAGE_COMPRESS, PORTAGE_COMPRESS_FLAGS, PORTAGE_RSYNC_EXTRA_OPTS
```
