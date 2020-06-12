# gentoo-optimized

An attempt at an organized and optimized gentoo configuration, including LTO, Graphite, PGO, customized cflags, etc

With credit to: https://github.com/InBetweenNames/gentooLTO

'emerge --info' output:

```
Portage 2.3.100 (python 3.8.3-final-0, default/linux/amd64/17.1/systemd, gcc-11.0.0, glibc-2.31-r3, 5.4.36 x86_64)

System uname: Linux-5.4.36-x86_64-AMD_Ryzen_5_3600_6-Core_Processor-with-glibc2.2.5
KiB Mem:    65821220 total,   7790776 free
KiB Swap:          0 total,         0 free

Timestamp of repository gentoo: Wed, 03 Jun 2020 15:35:34 +0000

Timestamp of repository FireBurn: Mon, 08 Jun 2020 08:43:38 +0000
Head commit of repository FireBurn: a484798474191d6573fdf685ef118977d11b4f06

Timestamp of repository R_Overlay: Mon, 08 Jun 2020 08:44:41 +0000
Head commit of repository R_Overlay: b0722fb587b8de53ea8fd506585f2f4f7f614fe1

Timestamp of repository ag-ops: Mon, 08 Jun 2020 08:44:28 +0000
Head commit of repository ag-ops: 0d7b38aa59b17688b511b971e08aa71522696448

Timestamp of repository ago: Mon, 08 Jun 2020 08:43:38 +0000
Head commit of repository ago: f863adb130a03302fccbc644c23671ec2d8048da

Timestamp of repository aluco: Mon, 08 Jun 2020 08:43:38 +0000
Head commit of repository aluco: 864e7da43a90c1ed2a0b417d0ec446dc859245a7

Timestamp of repository apurkrt: Sat, 06 Jun 2020 16:37:02 +0000
Head commit of repository apurkrt: acff0fc4a026a0f54adc2ef3f825271de4854203

Timestamp of repository archenroot: Mon, 01 Jun 2020 06:08:22 +0000
Head commit of repository archenroot: 3b52b1cf9f6708b6c2d913d13e4ef5c7614ae5d3

Timestamp of repository audio-overlay: Mon, 08 Jun 2020 08:44:20 +0000
Head commit of repository audio-overlay: 214b740890d7ebe03b4b5a9f6cc7ce90399dbdc5

Timestamp of repository awesome: Mon, 01 Jun 2020 06:07:33 +0000
Head commit of repository awesome: ba0ca228da0fa09c8093d012dfafbbf07aa29cd5

Timestamp of repository bitcoin: Mon, 08 Jun 2020 08:43:40 +0000
Head commit of repository bitcoin: 1235a95cb3cf6bda0fd83ee9edfcad618f5b2b48

Timestamp of repository bleeding-edge: Mon, 08 Jun 2020 08:43:42 +0000
Head commit of repository bleeding-edge: b4081562ff30244e4c634a76eb39d1c31fedacaf

Timestamp of repository brave-overlay: Thu, 28 May 2020 17:35:10 +0000
Head commit of repository brave-overlay: c959ffd517be397132787390a9cf3f8561d0ffa6

Timestamp of repository cg: Mon, 08 Jun 2020 08:44:06 +0000
Head commit of repository cg: 5bd6c9bddaf7fb08bbf5c218a63767b085d132b5

Timestamp of repository crossdev: Mon, 25 May 2020 21:50:18 +0000
Head commit of repository crossdev: 9e28aaa1563792892a65a4d020eeebdee31b7228

Timestamp of repository decent-im: Mon, 08 Jun 2020 08:44:23 +0000
Head commit of repository decent-im: f14a419b399c29f9620bd4ef3a40538867dccb34

Timestamp of repository dlang: Mon, 08 Jun 2020 08:43:43 +0000
Head commit of repository dlang: 71679d75fdd18b2cba157a8827bca97c8dc92146

Timestamp of repository docker: Mon, 25 May 2020 21:49:37 +0000
Head commit of repository docker: f1f06e8d9f87dd459ce55a62d2b30728343e6b29

Timestamp of repository dotnet: Mon, 08 Jun 2020 10:35:06 +0000
Head commit of repository dotnet: 4ec9963af5b449704290fb3b57fa322e25c470e1

Timestamp of repository drdim: Mon, 25 May 2020 21:49:37 +0000
Head commit of repository drdim: 52ec7b0bed600b5425aa0714ffc2b22a1fcd2a09

Timestamp of repository edgets: Wed, 27 May 2020 11:36:57 +0000
Head commit of repository edgets: 13d2af158b71ffebacc882d6f32790da41931e4f

Timestamp of repository ethereum: Mon, 08 Jun 2020 08:44:37 +0000
Head commit of repository ethereum: 2be737780da1ac8e2f614cfd38d7cc05eb6f80b3

Timestamp of repository ext-devlibs: Mon, 01 Jun 2020 06:07:37 +0000
Head commit of repository ext-devlibs: bcaa7136cae91f69e8ca50066060d7d4a1a6525c

Timestamp of repository fordfrog: Mon, 08 Jun 2020 08:43:47 +0000
Head commit of repository fordfrog: 81685997fe31c6551f661c0f309166f5c4644128

Timestamp of repository gitlab: Fri, 05 Jun 2020 20:05:16 +0000
Head commit of repository gitlab: 353ecdc82d3b44c24f9796118330a52229ef6161

Timestamp of repository gnome: Mon, 08 Jun 2020 08:43:47 +0000
Head commit of repository gnome: 235cae2f74cd640fcee86b48e647e8008b13c333

Timestamp of repository go-overlay: Mon, 08 Jun 2020 08:44:05 +0000
Head commit of repository go-overlay: 2d1f2a5e4bc1cddf404b1a9eb4ab1410fc637d6f

Timestamp of repository graaff: Mon, 08 Jun 2020 08:43:47 +0000
Head commit of repository graaff: 579342d7be884da3baea7c2ee7a5c53bdf9d2cc6

Timestamp of repository haskell: Mon, 08 Jun 2020 21:05:11 +0000
Head commit of repository haskell: 6d9b8f8719772a3879de6f5cd9bfb1e30d5241cd

Timestamp of repository hexedit-overlay: Mon, 25 May 2020 21:50:26 +0000
Head commit of repository hexedit-overlay: 8134c942c5a30e50ddc28f7697d7fdbd5165b934

Timestamp of repository imaging: Mon, 08 Jun 2020 08:44:09 +0000
Head commit of repository imaging: e41dd8d2168e4aa042c0099f55e447dbf72eb8dc

Timestamp of repository java: Sun, 07 Jun 2020 20:05:09 +0000
Head commit of repository java: f69e529482b3d327efe8837d45c3444544ff8525

Timestamp of repository junkdrawer: Mon, 08 Jun 2020 08:44:05 +0000
Head commit of repository junkdrawer: ac1ad4694981fecd61640dd0ef9fdc3e79330471

Timestamp of repository kde: Mon, 08 Jun 2020 13:05:10 +0000
Head commit of repository kde: 4c40d04b3132e0d694508dfab9c06a1f57007e6e

Timestamp of repository linuxunderground-overlay: Mon, 08 Jun 2020 16:05:10 +0000
Head commit of repository linuxunderground-overlay: 22e45514062a5e4707404fdceb0ab11e5abf5fa9

Timestamp of repository lto-overlay: Sat, 30 May 2020 15:05:02 +0000
Head commit of repository lto-overlay: e47925a5f48b7db4787c9954c7f10a36eea79f61

Timestamp of repository lua: Mon, 08 Jun 2020 08:43:51 +0000
Head commit of repository lua: fab07bb30a7e3b5da3991be4242595ce0ae69790

Timestamp of repository matrix: Mon, 08 Jun 2020 08:44:19 +0000
Head commit of repository matrix: 526e03cd7da542108a0498c8ed46114f352811b4

Timestamp of repository megacoffee: Mon, 01 Jun 2020 12:35:03 +0000
Head commit of repository megacoffee: 2a6f7e7daa663b62a27819703693f4bb9b9a0440

Timestamp of repository mozilla: Thu, 28 May 2020 12:05:20 +0000
Head commit of repository mozilla: afecb2ea12c8a726aea9bccc8e2ef70984b1a9a1

Timestamp of repository multilib-portage: Fri, 05 Jun 2020 07:35:01 +0000
Head commit of repository multilib-portage: 605b2cba9fd385c4294fe3cc926eff9a17ac57e3

Timestamp of repository mv: Mon, 08 Jun 2020 08:43:52 +0000
Head commit of repository mv: f1fa4cc338ad6af97f2400c7fe038ff621dd92ad

Timestamp of repository mysql: Mon, 08 Jun 2020 08:43:52 +0000
Head commit of repository mysql: e0d03256f5500c2ad301f95f1d9fe50529db10c1

Timestamp of repository pentoo: Mon, 08 Jun 2020 19:05:10 +0000
Head commit of repository pentoo: 787a59660bb93d74f19ae308bc69f016f3e6e29f

Timestamp of repository perl-experimental: Mon, 25 May 2020 21:49:57 +0000
Head commit of repository perl-experimental: bb376ad41d1663864d10b7deff160b4ead58c1db

Timestamp of repository plex-overlay: Mon, 08 Jun 2020 08:44:36 +0000
Head commit of repository plex-overlay: 71c4d0df5acce183bd369998e208734b2417eab0

Timestamp of repository python: Mon, 25 May 2020 21:50:19 +0000
Head commit of repository python: c02d56024aeb92dc4e50aa9587b0a1b6baff3107

Timestamp of repository qgp: Mon, 08 Jun 2020 08:44:30 +0000
Head commit of repository qgp: 7b6465f9b75fbb3c83ca5cf42bb6f4eb2e3e4274

Timestamp of repository qt: Wed, 03 Jun 2020 11:05:16 +0000
Head commit of repository qt: f37db0d7be537e4dc00c1cd487747b014817e2d2

Timestamp of repository quarks: Mon, 08 Jun 2020 08:43:55 +0000
Head commit of repository quarks: a73b408cdb9d476f30bdf50c94a8c86e2e325e8b

Timestamp of repository qwin-overlay: Thu, 28 May 2020 06:05:17 +0000
Head commit of repository qwin-overlay: 18a5400a6eb9d8bf60d2e24666104606d03b38ca

Timestamp of repository ricerlay: Mon, 08 Jun 2020 08:44:30 +0000
Head commit of repository ricerlay: 9ccb97c55d5210256efecc155c4137c3a8344e92

Timestamp of repository ruby: Mon, 25 May 2020 21:50:02 +0000
Head commit of repository ruby: ee6d032968c51d16b88657915fca4bfcc2110bb7

Timestamp of repository rust: Fri, 05 Jun 2020 10:05:05 +0000
Head commit of repository rust: a10356734c62d69fa8f02c42121d570171a41935

Timestamp of repository sabayon: Mon, 08 Jun 2020 08:44:37 +0000
Head commit of repository sabayon: 4ce2281ec88fb11342fc52f49d3881dd945ce4e5

Timestamp of repository science: Mon, 08 Jun 2020 08:44:38 +0000
Head commit of repository science: eb59711d4a77c263b18b10be0b7308ea253e26e8

Timestamp of repository scrill: Mon, 25 May 2020 21:50:05 +0000
Head commit of repository scrill: 67f7e756cd3263e6c4ba1b4c846f0cbc2a4a908a

Timestamp of repository snapd: Mon, 25 May 2020 21:51:07 +0000
Head commit of repository snapd: 6bc25838ad40929753cff5363ac30350b9865ab3

Timestamp of repository soltys: Mon, 08 Jun 2020 08:44:28 +0000
Head commit of repository soltys: 48a98e6fe08f7a77a9b0c7cb92d01d1e9241cf82

Timestamp of repository steam-overlay: Mon, 01 Jun 2020 06:07:52 +0000
Head commit of repository steam-overlay: 45bd91ee3533a6273e54a353cee59cc8c2931d44

Timestamp of repository toolchain: Sat, 22 Feb 2020 10:05:46 +0000
Head commit of repository toolchain: 523f25097ac0d12a0629aeee6cc06073949f9ae1

Timestamp of repository torbrowser: Thu, 04 Jun 2020 07:10:19 +0000
Head commit of repository torbrowser: cec588ddc133d6c0e761f20b358868650aca9f1c

Timestamp of repository webos: Mon, 08 Jun 2020 08:44:03 +0000
Head commit of repository webos: 3d13104eca03486cb3a3ac25ef68c7f174522f47

Timestamp of repository what4-java: Mon, 25 May 2020 21:50:59 +0000
Head commit of repository what4-java: 881c684daf41cb732fa69152acc8b3d76dc1ed5d

Timestamp of repository x11: Mon, 08 Jun 2020 08:44:04 +0000
Head commit of repository x11: 51b657ed0e97dfc19f1733db6f119c723ee22ded

Timestamp of repository yoreek: Mon, 25 May 2020 21:50:15 +0000
Head commit of repository yoreek: 5ef3b47fd5fe27826f8a1fa8f2b4cf62490e56cf

sh bash 5.0_p17
ld GNU ld (Gentoo 2.34 p4) 2.34.0
ccache version 3.7.9 [enabled]
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
sys-devel/gcc:            8.4.0-r1::gentoo, 11.0.0_pre9999::gentoo
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

ABI="amd64"
ABI_X86="64"
ACCEPT_KEYWORDS="amd64 ~amd64"
ACCEPT_LICENSE="*"
ACCEPT_PROPERTIES="*"
ACCEPT_RESTRICT="*"
ADA_TARGET="gnat_2018"
ALSA_CARDS="hda-intel nvidia nv dummy"
ANT_HOME="/usr/share/ant"
APACHE2_MODULES="actions alias auth_basic authn_alias authn_anon authn_core authn_dbm authn_default authn_file authz_core authz_dbm authz_default authz_groupfile authz_host authz_owner authz_user autoindex cache cgi cgid dav dav_fs dav_lock deflate dir disk_cache env expires ext_filter file_cache filter headers include info log_config logio mem_cache mime mime_magic negotiation rewrite setenvif socache_shmcb speling status unique_id unixd userdir usertrack vhost_alias"
ARCH="amd64"
ARCHLINUX_RICE="-fbranch-target-load-optimize2 -fcx-fortran-rules -fipa-pta -fno-enforce-eh-specs -fnothrow-opt -fno-var-tracking-assignments -freschedule-modulo-scheduled-loops -fsched-pressure -fsched-spec-load -fsched-spec-load-dangerous -fsched-stalled-insns=0 -fsched2-use-superblocks -fselective-scheduling -fselective-scheduling2 -fsel-sched-pipelining -fsel-sched-pipelining-outer-loops -ftree-lrs -maccumulate-outgoing-args -fmerge-all-constants"
AUTOCLEAN="yes"
BINPKG_COMPRESS="bzip2"
BOOTSTRAP_USE="unicode internal-glib pkg-config split-usr python_targets_python3_7 python_targets_python2_7 multilib systemd udev systemd udev"
BOOT_CFLAGS="-march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
BROOT=""
CALLIGRA_FEATURES="karbon sheets words"
CBUILD="x86_64-pc-linux-gnu"
CCACHE_DIR="/tmp/ccache"
CFLAGS="-march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
CFLAGS_amd64="-m64"
CFLAGS_x32="-mx32"
CFLAGS_x86="-m32"
CHOST="x86_64-pc-linux-gnu"
CHOST_amd64="x86_64-pc-linux-gnu"
CHOST_x32="x86_64-pc-linux-gnux32"
CHOST_x86="i686-pc-linux-gnu"
CLEAN_DELAY="5"
CMAKE_CXX_COMPILER="command g++ -O2 -pipe"
CMAKE_C_COMPILER="command gcc -march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
CMAKE_LINKER="command ld -Wl,-O1 -Wl,--as-needed"
CMAKE_MAKEFILE_GENERATOR="ninja"
COLLECTD_PLUGINS="df interface irq load memory rrdtool swap syslog"
COLLISION_IGNORE="/lib/modules/*"
CONFIG_PROTECT="/etc /usr/share/config /usr/share/gnupg/qualified.txt"
CONFIG_PROTECT_MASK="/etc/ca-certificates.conf /etc/dconf /etc/env.d /etc/fonts/fonts.conf /etc/gconf /etc/gentoo-release /etc/php/apache2-php7.4/ext-active/ /etc/php/cgi-php7.4/ext-active/ /etc/php/cli-php7.4/ext-active/ /etc/revdep-rebuild /etc/sandbox.d /etc/terminfo /etc/texmf/language.dat.d /etc/texmf/language.def.d /etc/texmf/updmap.d /etc/texmf/web2c"
CPU_FLAGS_X86="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sha sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3"
CXXFLAGS="-march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
DEFAULT_ABI="amd64"
DEVIRTLTO="-fdevirtualize-at-ltrans"
DISTDIR="/usr/portage/distfiles"
EDITOR="nano"
ELIBC="glibc"
EMERGE_DEFAULT_OPTS="--ask --ask-enter-invalid --autounmask-backtrack=y --autounmask=y --binpkg-respect-use=y --buildpkg-exclude=virtual/* --buildpkg=y --complete-graph=y --keep-going=y --quiet-fail=y --verbose --verbose-conflicts --with-bdeps=y --with-test-deps=n --jobs 8 --load-average 12.0"
EMERGE_WARNING_DELAY="10"
ENV_UNSET="DBUS_SESSION_BUS_ADDRESS DISPLAY GOBIN PERL5LIB PERL5OPT PERLPREFIX PERL_CORE PERL_MB_OPT PERL_MM_OPT XAUTHORITY XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_RUNTIME_DIR"
EPREFIX=""
EROOT="/"
ESYSROOT="/"
EXTRA_FFMPEG_CONF="--enable-lto"
FCFLAGS="-march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
FEATURES="assume-digests binpkg-docompress binpkg-dostrip binpkg-logs buildpkg ccache cgroup compress-index config-protect-if-modified distlocks ebuild-locks fixlafiles merge-sync multilib-strict network-sandbox news nodoc parallel-fetch preserve-libs qa-unresolved-soname-deps sfperms strict strict-keepdir unknown-features-warn unmerge-logs unmerge-orphans userfetch userpriv usersync xattr"
FETCHCOMMAND="wget -t 3 -T 60 --passive-ftp -O "${DISTDIR}/${FILE}" "${URI}""
FETCHCOMMAND_RSYNC="rsync -LtvP "${URI}" "${DISTDIR}/${FILE}""
FETCHCOMMAND_SFTP="bash -c "x=\${2#sftp://} ; host=\${x%%/*} ; port=\${host##*:} ; host=\${host%:*} ; [[ \${host} = \${port} ]] && port= ; eval \"declare -a ssh_opts=(\${3})\" ; exec sftp \${port:+-P \${port}} \"\${ssh_opts[@]}\" \"\${host}:/\${x#*/}\" \"\$1\"" sftp "${DISTDIR}/${FILE}" "${URI}" "${PORTAGE_SSH_OPTS}""
FETCHCOMMAND_SSH="bash -c "x=\${2#ssh://} ; host=\${x%%/*} ; port=\${host##*:} ; host=\${host%:*} ; [[ \${host} = \${port} ]] && port= ; exec rsync --rsh=\"ssh \${port:+-p\${port}} \${3}\" -avP \"\${host}:/\${x#*/}\" \"\$1\"" rsync "${DISTDIR}/${FILE}" "${URI}" "${PORTAGE_SSH_OPTS}""
FFLAGS="-march=znver2 -Ofast -pipe -g0 -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
FLTO="-flto=12"
GCC_SPECS=""
GENTOO_MIRRORS="https://ftp.fau.de/gentoo"
GPSD_PROTOCOLS="aivdm ashtech earthmate evermore fv18 garmin garmintxt gpsclock greis isync itrax mtk3301 navcom nmea ntrip oceanserver oldstyle oncore rtcm104v2 rtcm104v3 sirf skytraq superstar2 timing tnt tripmate tsip ublox ubx"
GRAPHITE="-fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize"
GRUB_PLATFORMS="pc efi-64"
GSETTINGS_BACKEND="dconf"
HOME="/root"
IBPATH="/usr/sbin"
INFINALITY_FT_AUTOHINT_HORIZONTAL_STEM_DARKEN_STRENGTH="10"
INFINALITY_FT_AUTOHINT_INCREASE_GLYPH_HEIGHTS="false"
INFINALITY_FT_AUTOHINT_SNAP_STEM_HEIGHT="100"
INFINALITY_FT_AUTOHINT_VERTICAL_STEM_DARKEN_STRENGTH="25"
INFINALITY_FT_BOLD_EMBOLDEN_X_VALUE="0"
INFINALITY_FT_BOLD_EMBOLDEN_Y_VALUE="0"
INFINALITY_FT_BRIGHTNESS="0"
INFINALITY_FT_CHROMEOS_STYLE_SHARPENING_STRENGTH="0"
INFINALITY_FT_CONTRAST="0"
INFINALITY_FT_FILTER_PARAMS="06 25 44 25 06"
INFINALITY_FT_FRINGE_FILTER_STRENGTH="0"
INFINALITY_FT_GAMMA_CORRECTION="0 100"
INFINALITY_FT_GLOBAL_EMBOLDEN_X_VALUE="0"
INFINALITY_FT_GLOBAL_EMBOLDEN_Y_VALUE="0"
INFINALITY_FT_GRAYSCALE_FILTER_STRENGTH="0"
INFINALITY_FT_STEM_ALIGNMENT_STRENGTH="0"
INFINALITY_FT_STEM_FITTING_STRENGTH="0"
INFINALITY_FT_STEM_SNAPPING_SLIDING_SCALE="0"
INFINALITY_FT_USE_KNOWN_SETTINGS_ON_SELECTED_FONTS="false"
INFINALITY_FT_USE_VARIOUS_TWEAKS="true"
INFINALITY_FT_WINDOWS_STYLE_SHARPENING_STRENGTH="0"
INFOPATH="/usr/share/gcc-data/x86_64-pc-linux-gnu/11.0.0/info:/usr/share/binutils-data/x86_64-pc-linux-gnu/2.34/info:/usr/share/info"
INPUT_DEVICES="keyboard mouse evdev libinput"
IPAPTA="-fipa-pta"
IUSE_IMPLICIT="abi_x86_64 prefix prefix-guest prefix-stack"
KERNEL="linux"
L10N="en en_US en-US"
LADSPA_PATH="/usr/lib64/ladspa"
LANG="en_US.UTF-8"
LCD_DEVICES="bayrad cfontz cfontz633 glk hd44780 lb216 lcdm001 mtxorb ncurses text"
LC_MESSAGES="C"
LDFLAGS="-Wl,-O4,--sort-common,--as-needed,-z,norelro,-z,now"
LDFLAGS_amd64="-m elf_x86_64"
LDFLAGS_x32="-m elf32_x86_64"
LDFLAGS_x86="-m elf_i386"
LESS="-sFRiMX --shift 5"
LESSOPEN="|lesspipe.sh %s"
LESS_ADVANCED_PREPROCESSOR="1"
LIBDIR_amd64="lib64"
LIBDIR_x32="libx32"
LIBDIR_x86="lib"
LIBREOFFICE_EXTENSIONS="presenter-console presenter-minimizer"
LINGUAS="en en_US"
LLVM_TARGETS="AMDGPU BPF NVPTX X86 AArch64 ARM WebAssembly XCore"
LOGNAME="root"
LS_OPTIONS="--color=auto -h"
LUA_TARGETS="lua53"
LV2_PATH="/usr/lib64/lv2"
MAIL="/var/mail/root"
MAKEOPTS="-j12 -l12"
MANPAGER="manpager"
MANPATH="/usr/share/gcc-data/x86_64-pc-linux-gnu/11.0.0/man:/usr/share/binutils-data/x86_64-pc-linux-gnu/2.34/man:/etc/java-config-2/current-system-vm/man/:/usr/lib64/php7.4/man/:/usr/local/share/man:/usr/share/man:/usr/lib/llvm/10/share/man"
MOZ_GMP_PATH="/usr/lib64/nsbrowser/plugins/gmp-gmpopenh264/system-installed"
MULTILIB_ABIS="amd64 x86"
MULTILIB_STRICT_DENY="64-bit.*shared object"
MULTILIB_STRICT_DIRS="/lib32 /lib /usr/lib32 /usr/lib /usr/kde/*/lib32 /usr/kde/*/lib /usr/qt/*/lib32 /usr/qt/*/lib /usr/X11R6/lib32 /usr/X11R6/lib"
MULTILIB_STRICT_EXEMPT="(perl5|gcc|gcc-lib|binutils|eclipse-3|debug|portage|udev|systemd|clang|python-exec|llvm)"
NGINX_MODULES_HTTP="access fastcgi gzip proxy rewrite"
NOCOLOR="true"
NOCOMMON="-fno-common"
NOPLT="-fno-plt"
NTHREADS="12"
OFFICE_IMPLEMENTATION="libreoffice"
OLDPWD="/home/gnum/src/github"
PAGER="less"
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/dell/srvadmin/bin:/opt/dell/srvadmin/sbin"
PHP_TARGETS="php7-2"
PKGDIR="/usr/portage/packages"
PORTAGE_ARCHLIST="alpha amd64 amd64-linux arm arm-linux arm64 arm64-linux hppa ia64 m68k m68k-mint mips ppc ppc-aix ppc-macos ppc64 ppc64-linux riscv s390 sparc sparc-solaris sparc64-solaris x64-cygwin x64-macos x64-solaris x64-winnt x86 x86-cygwin x86-linux x86-macos x86-solaris x86-winnt"
PORTAGE_BINHOST="http://packages.gentooexperimental.org/packages/amd64-unstable/"
PORTAGE_BIN_PATH="/usr/lib/portage/python3.8"
PORTAGE_COMPRESS_EXCLUDE_SUFFIXES="css gif htm[l]? jp[e]?g js pdf png"
PORTAGE_CONFIGROOT="/"
PORTAGE_DEBUG="0"
PORTAGE_DEPCACHEDIR="/var/cache/edb/dep"
PORTAGE_ELOG_CLASSES="qa warn"
PORTAGE_ELOG_MAILFROM="portage@localhost"
PORTAGE_ELOG_MAILSUBJECT="[portage] ebuild log for ${PACKAGE} on ${HOST}"
PORTAGE_ELOG_MAILURI="root"
PORTAGE_ELOG_SYSTEM="save_summary:log,warn,error,qa echo"
PORTAGE_FETCH_CHECKSUM_TRY_MIRRORS="5"
PORTAGE_FETCH_RESUME_MIN_SIZE="350K"
PORTAGE_GID="250"
PORTAGE_GPG_DIR="/etc/portage/gpg"
PORTAGE_GPG_SIGNING_COMMAND="gpg --sign --digest-algo SHA256 --clearsign --yes --default-key "${PORTAGE_GPG_KEY}" --homedir "${PORTAGE_GPG_DIR}" "${FILE}""
PORTAGE_INST_GID="0"
PORTAGE_INST_UID="0"
PORTAGE_INTERNAL_CALLER="1"
PORTAGE_LOGDIR_CLEAN="find "${PORTAGE_LOGDIR}" -type f ! -name "summary.log*" -mtime +7 -delete"
PORTAGE_NICENESS="-19"
PORTAGE_OVERRIDE_EPREFIX=""
PORTAGE_PYM_PATH="/usr/lib/python3.8/site-packages"
PORTAGE_PYTHONPATH="/usr/lib/python3.8/site-packages"
PORTAGE_RSYNC_OPTS="--recursive --links --safe-links --perms --times --omit-dir-times --compress --force --whole-file --delete --stats --human-readable --timeout=180 --exclude=/distfiles --exclude=/local --exclude=/packages --exclude=/.git"
PORTAGE_RSYNC_RETRIES="-1"
PORTAGE_SYNC_STALE="30"
PORTAGE_TMPDIR="/tmp"
PORTAGE_VERBOSE="1"
PORTAGE_WORKDIR_MODE="0700"
PORTAGE_XATTR_EXCLUDE="btrfs.* security.evm security.ima 	security.selinux system.nfs4_acl user.apache_handler 	user.Beagle.* user.dublincore.* user.mime_encoding user.xdg.*"
PORT_LOGDIR="/var/log/emerge-log"
POSTGRES_TARGETS="postgres10 postgres11"
PROFILE_ONLY_VARIABLES="ARCH ELIBC IUSE_IMPLICIT KERNEL USERLAND USE_EXPAND_IMPLICIT USE_EXPAND_UNPREFIXED USE_EXPAND_VALUES_ARCH USE_EXPAND_VALUES_ELIBC USE_EXPAND_VALUES_KERNEL USE_EXPAND_VALUES_USERLAND"
PS1="\[\033]0;\u@\h:\w\007\]\u@\h \w \$ "
PWD="/home/gnum/src/github/gentoo-optimized"
PYTHONDONTWRITEBYTECODE="1"
PYTHON_SINGLE_TARGET="python3_8"
PYTHON_TARGETS="python3_8 python3_9 python3_7 python3_6 python2_7 pypy3"
QEMU_SOFTMMU_TARGETS="x86_64 aarch64 arm"
QEMU_USER_TARGETS="x86_64 aarch64 arm"
RESUMECOMMAND="wget -c -t 3 -T 60 --passive-ftp -O "${DISTDIR}/${FILE}" "${URI}""
RESUMECOMMAND_RSYNC="rsync -LtvP "${URI}" "${DISTDIR}/${FILE}""
RESUMECOMMAND_SSH="bash -c "x=\${2#ssh://} ; host=\${x%%/*} ; port=\${host##*:} ; host=\${host%:*} ; [[ \${host} = \${port} ]] && port= ; exec rsync --rsh=\"ssh \${port:+-p\${port}} \${3}\" -avP \"\${host}:/\${x#*/}\" \"\$1\"" rsync "${DISTDIR}/${FILE}" "${URI}" "${PORTAGE_SSH_OPTS}""
ROOT="/"
ROOTPATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/10/bin:/opt/cuda/bin"
RPMDIR="/var/cache/rpm"
RUBY_TARGETS="ruby27 ruby26 ruby25"
RUSTFLAGS="-Ctarget-cpu=native"
R_HOME="/usr/lib64/R"
SAFER_FAST_MATH="-fno-signed-zeros -fno-trapping-math -fassociative-math -freciprocal-math -fno-math-errno -ffinite-math-only -fno-rounding-math -fno-signaling-nans -fcx-limited-range -fexcess-precision=fast"
SAFER_UNSAFE_MATH_OPTS="-fno-signed-zeros -fno-trapping-math -fassociative-math -freciprocal-math"
SAFEST_FAST_MATH="-fno-math-errno -fno-trapping-math"
SEMINTERPOS="-fno-semantic-interposition"
SHELL="/bin/bash"
SHLVL="2"
SSH_CLIENT="74.70.75.98 59152 22"
SSH_CONNECTION="74.70.75.98 59152 95.217.117.234 22"
SSH_TTY="/dev/ttyp1"
SYMLINK_LIB="no"
SYSROOT="/"
TERM="xterm-256color"
TWISTED_DISABLE_WRITING_OF_PLUGIN_CACHE="1"
UNINSTALL_IGNORE="/lib/modules/* /var/run /var/lock"
USE="X a52 aac acl acpi alsa amd64 asm avx bash-completion bcache berkdb blksha1 boost branding bzip2 cairo caps ccache cdda cdr cli contrib corefonts crypt curl custom-cflags custom-optimization custom-tune cxx daemon dbus dev-libs device-mapper dhcpcd dmraid dri dri3 dts dvd dvdr eclipse emboss encode eselect exif expat fbcon ffmpeg flac flambda fontconfig fortran fpm gcrypt gd gdbm gif git glamor gmp go gold gpm graphite gstreamer gtk gtk3 gtk4 guile gzip handbook hddtemp hscolour hwloc iconv icu idn infinality initramfs inotify jemalloc jit jpeg jpeg2k json jsonc kde lame latex lcms libnotify libsamplerate libssh libtirpc lm-sensors lm_sensors lock lrzip lto lv4 lz4 lzma lzo mad matroska mdadm mime mmap mmx mmxext mng mono mp3 mp4 mpeg mpi multilib multitarget ncurses nlopt nptl nscd nvidia offensive offload ogg oil openal opencl opengl openmp optimizations optimize orc override-flagomatic pam pango pch pclmul pcre pdf perl pgo pic png policykit popcnt ppds profile profiler profiling pulseaudio pypy3 python qt5 r_suggests_spacetime rar rdesktop readline resize-optimization ruby sasl sctp sdl seccomp session smp sndfile snmp sockets socks5 sound source spacetime spell split-usr sqlite ssh ssl startup-notification svg syslog system-bzip2 system-harfbuzz system-icu system-jpeg system-libevent system-libvpx system-libwebp system-lua system-sqlite system-zlib systemd systemtap szip tcl tcmalloc tcpd telemetry text theora threads thunar tidy tiff tk tools truetype twolame udev udisks unicode unzip upnp upnp-av upower usr-portage util utils uvm vaapi vdo vdpau vhosts vim vim-syntax vnc vorbis vpx vulkan webkit webp webui wmf wxwidgets x264 x265 xattr xcb xcomposite xface xft xine xinetd xla xml xmlrpc xmpp xorg xpm xscreensaver xv xvid xz zeroconf zip zlib zsh zsh-completion zstd" ABI_X86="64" ADA_TARGET="gnat_2018" ALSA_CARDS="hda-intel nvidia nv dummy" APACHE2_MODULES="actions alias auth_basic authn_alias authn_anon authn_core authn_dbm authn_default authn_file authz_core authz_dbm authz_default authz_groupfile authz_host authz_owner authz_user autoindex cache cgi cgid dav dav_fs dav_lock deflate dir disk_cache env expires ext_filter file_cache filter headers include info log_config logio mem_cache mime mime_magic negotiation rewrite setenvif socache_shmcb speling status unique_id unixd userdir usertrack vhost_alias" CALLIGRA_FEATURES="karbon sheets words" COLLECTD_PLUGINS="df interface irq load memory rrdtool swap syslog" CPU_FLAGS_X86="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sha sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3" ELIBC="glibc" GPSD_PROTOCOLS="aivdm ashtech earthmate evermore fv18 garmin garmintxt gpsclock greis isync itrax mtk3301 navcom nmea ntrip oceanserver oldstyle oncore rtcm104v2 rtcm104v3 sirf skytraq superstar2 timing tnt tripmate tsip ublox ubx" GRUB_PLATFORMS="pc efi-64" INPUT_DEVICES="keyboard mouse evdev libinput" KERNEL="linux" L10N="en en_US en-US" LCD_DEVICES="bayrad cfontz cfontz633 glk hd44780 lb216 lcdm001 mtxorb ncurses text" LIBREOFFICE_EXTENSIONS="presenter-console presenter-minimizer" LLVM_TARGETS="AMDGPU BPF NVPTX X86 AArch64 ARM WebAssembly XCore" NGINX_MODULES_HTTP="access fastcgi gzip proxy rewrite" OFFICE_IMPLEMENTATION="libreoffice" PHP_TARGETS="php7-2" POSTGRES_TARGETS="postgres10 postgres11" PYTHON_SINGLE_TARGET="python3_8" PYTHON_TARGETS="python3_8 python3_9 python3_7 python3_6 python2_7 pypy3" QEMU_SOFTMMU_TARGETS="x86_64 aarch64 arm" QEMU_USER_TARGETS="x86_64 aarch64 arm" RUBY_TARGETS="ruby27 ruby26 ruby25" USERLAND="GNU" VIDEO_CARDS="nv nvidia vesa fbdev nouveau dummy v4l" XTABLES_ADDONS="account chaos condition delude dhcpmac fuzzy geoip iface ipmark ipp2p ipset ipv4options length2 logmark lscan pknock psd quota2 rawnat steal sysrq tarpit tee"
USER="root"
USERLAND="GNU"
USE_EXPAND="ABI_MIPS ABI_PPC ABI_RISCV ABI_S390 ABI_X86 ADA_TARGET ALSA_CARDS APACHE2_MODULES APACHE2_MPMS CALLIGRA_FEATURES CAMERAS COLLECTD_PLUGINS CPU_FLAGS_ARM CPU_FLAGS_PPC CPU_FLAGS_X86 CURL_SSL ELIBC ENLIGHTENMENT_MODULES FFTOOLS GPSD_PROTOCOLS GRUB_PLATFORMS INPUT_DEVICES KERNEL L10N LCD_DEVICES LIBREOFFICE_EXTENSIONS LIRC_DEVICES LLVM_TARGETS MONKEYD_PLUGINS NGINX_MODULES_HTTP NGINX_MODULES_MAIL NGINX_MODULES_STREAM OFED_DRIVERS OFFICE_IMPLEMENTATION OPENMPI_FABRICS OPENMPI_OFED_FEATURES OPENMPI_RM PHP_TARGETS POSTGRES_TARGETS PYTHON_SINGLE_TARGET PYTHON_TARGETS QEMU_SOFTMMU_TARGETS QEMU_USER_TARGETS ROS_MESSAGES RUBY_TARGETS SANE_BACKENDS USERLAND UWSGI_PLUGINS VIDEO_CARDS VOICEMAIL_STORAGE XFCE_PLUGINS XTABLES_ADDONS"
USE_EXPAND_HIDDEN="ABI_MIPS ABI_PPC ABI_RISCV ABI_S390 CPU_FLAGS_ARM CPU_FLAGS_PPC ELIBC KERNEL USERLAND"
USE_EXPAND_IMPLICIT="ARCH ELIBC KERNEL USERLAND"
USE_EXPAND_UNPREFIXED="ARCH"
USE_EXPAND_VALUES_ARCH="alpha amd64 amd64-fbsd amd64-linux arm arm64 hppa ia64 m68k m68k-mint mips ppc ppc64 ppc64-linux ppc-aix ppc-macos riscv s390 sparc sparc64-solaris sparc-solaris x64-cygwin x64-macos x64-solaris x64-winnt x86 x86-cygwin x86-fbsd x86-linux x86-macos x86-solaris x86-winnt"
USE_EXPAND_VALUES_ELIBC="AIX bionic Cygwin Darwin DragonFly FreeBSD glibc HPUX Interix mingw mintlib musl NetBSD OpenBSD SunOS uclibc Winnt"
USE_EXPAND_VALUES_KERNEL="AIX Darwin FreeBSD freemint HPUX linux NetBSD OpenBSD SunOS Winnt"
USE_EXPAND_VALUES_USERLAND="BSD GNU"
USE_ORDER="env:pkg:conf:defaults:pkginternal:features:repo:env.d"
VIDEO_CARDS="nv nvidia vesa fbdev nouveau dummy v4l"
VISUAL="/bin/nano"
XDG_CONFIG_DIRS="/etc/xdg"
XDG_DATA_DIRS="/usr/local/share:/usr/share"
XTABLES_ADDONS="account chaos condition delude dhcpmac fuzzy geoip iface ipmark ipp2p ipset ipv4options length2 logmark lscan pknock psd quota2 rawnat steal sysrq tarpit tee"
_NO_SSP="-fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check"
```
