# gentoo-optimized

An attempt at an organized and optimized gentoo configuration, including LTO, Graphite, PGO, customized cflags, etc

With credit to: https://github.com/InBetweenNames/gentooLTO

'emerge --info' output:

```
Portage 2.3.100 (python 3.8.3-final-0, default/linux/amd64/17.1/systemd, gcc-11.0.0, glibc-2.31-r5, 5.4.36 x86_64)
=================================================================
System uname: Linux-5.4.36-x86_64-AMD_Ryzen_5_3600_6-Core_Processor-with-glibc2.2.5
KiB Mem:    65821220 total,  11299392 free
KiB Swap:          0 total,         0 free
Timestamp of repository gentoo: Sat, 13 Jun 2020 22:35:17 +0000
Head commit of repository gentoo: b2949968d4b92aef46c88eb85926522f9e18ca24

Timestamp of repository FireBurn: Sat, 13 Jun 2020 18:22:15 +0000
Head commit of repository FireBurn: a9794d6d1c3b64521b65839781f0edb5c1fd4712

Timestamp of repository R_Overlay: Sat, 13 Jun 2020 18:24:10 +0000
Head commit of repository R_Overlay: b12a3a393120a4c41d564e86990755c43c6cc5d4

Timestamp of repository ag-ops: Sat, 13 Jun 2020 18:23:45 +0000
Head commit of repository ag-ops: b6f3f7090e4dc2caa12620d93b94a578ffd44bdd

Timestamp of repository ago: Sat, 13 Jun 2020 18:22:15 +0000
Head commit of repository ago: 9e0928c1b44745eea64b7ea4a0ff82d7f49cb989

Timestamp of repository aluco: Sat, 13 Jun 2020 18:22:15 +0000
Head commit of repository aluco: 90d636d23d3944acbaf3754a6322505bc2d228df

Timestamp of repository apurkrt: Sat, 13 Jun 2020 18:24:01 +0000
Head commit of repository apurkrt: 99378a648bb6764dc15518e143018da2cecb8f15

Timestamp of repository archenroot: Sat, 13 Jun 2020 18:23:54 +0000
Head commit of repository archenroot: a2110fcb8179dd6ff9f6540c9b335c4aa6fcc1f6

Timestamp of repository audio-overlay: Sat, 13 Jun 2020 18:23:34 +0000
Head commit of repository audio-overlay: 9d76d670b1a466d0b4e58e6e9f8f18c5a68df4a3

Timestamp of repository awesome: Sat, 13 Jun 2020 18:22:19 +0000
Head commit of repository awesome: 2ffc3e43e20a555f6f3def9093fc8e4a700b8ade

Timestamp of repository bitcoin: Sat, 13 Jun 2020 18:22:20 +0000
Head commit of repository bitcoin: a55d1285462c6c892ef3c28fa01b4e62b3bd7559

Timestamp of repository bleeding-edge: Sat, 13 Jun 2020 18:22:20 +0000
Head commit of repository bleeding-edge: bac49a3a9adb71ecc16acdfc71fe8a5f73e13ec4

Timestamp of repository brave-overlay: Sat, 13 Jun 2020 18:23:49 +0000
Head commit of repository brave-overlay: 020d25a78a4d7eec9a28a0e97fda3be776561579

Timestamp of repository cg: Sat, 13 Jun 2020 18:23:09 +0000
Head commit of repository cg: 5c1fae4b392bb3d7a237aefe702b06eaa4112132

Timestamp of repository crossdev: Sat, 13 Jun 2020 18:23:07 +0000
Head commit of repository crossdev: dca4aa81b5165bfec9cc20a547c38a5e1c779b79

Timestamp of repository decent-im: Sat, 13 Jun 2020 18:23:39 +0000
Head commit of repository decent-im: 467e353f4ee6d3b87da1a7c0296cb43160d56832

Timestamp of repository dlang: Sat, 13 Jun 2020 18:22:25 +0000
Head commit of repository dlang: 6abd05f1626f5c055cd289666b384bed8f4557d3

Timestamp of repository docker: Sat, 13 Jun 2020 18:22:25 +0000
Head commit of repository docker: cc6df36a8152347136ff951059f7f33245268c39

Timestamp of repository dotnet: Sat, 13 Jun 2020 18:22:25 +0000
Head commit of repository dotnet: 5d7b011cf4ed703a5b40ac440f20fbd6cb6c20a5

Timestamp of repository drdim: Sat, 13 Jun 2020 18:22:25 +0000
Head commit of repository drdim: 9435e1afd3216709db0a87b3d053f085aa15d261

Timestamp of repository edgets: Sat, 13 Jun 2020 18:24:05 +0000
Head commit of repository edgets: 4e823a5596a6e0c3c54c620d5ff1923b78e192b4

Timestamp of repository ethereum: Sat, 13 Jun 2020 18:24:03 +0000
Head commit of repository ethereum: 1ebc75baf11ab5f5dbe648e4337189319c105c63

Timestamp of repository ext-devlibs: Sat, 13 Jun 2020 18:22:28 +0000
Head commit of repository ext-devlibs: d0811031257b4964d35f5fe97dd058e58cab5ff4

Timestamp of repository fordfrog: Sat, 13 Jun 2020 19:05:08 +0000
Head commit of repository fordfrog: a1c80295a191bcacf652ca08569ac706b4724af3

Timestamp of repository gitlab: Sat, 13 Jun 2020 18:22:32 +0000
Head commit of repository gitlab: ba1c286fdab7574d1a7e3a08d796761576064d92

Timestamp of repository gnome: Sat, 13 Jun 2020 18:22:32 +0000
Head commit of repository gnome: 34b8efcbeec610a382663d45e77b5997a2d4c42a

Timestamp of repository go-overlay: Sat, 13 Jun 2020 18:23:08 +0000
Head commit of repository go-overlay: da2021db9f4dadecbf81c4561183ced04c41d6e5

Timestamp of repository graaff: Sat, 13 Jun 2020 18:22:32 +0000
Head commit of repository graaff: b413a8bb2952cce5993aedd35f943083840fadf4

Timestamp of repository haskell: Sat, 13 Jun 2020 18:24:10 +0000
Head commit of repository haskell: fa5d611755263c4a9589e449c342dadbbd1c760f

Timestamp of repository hexedit-overlay: Sat, 13 Jun 2020 21:35:07 +0000
Head commit of repository hexedit-overlay: a98e31618d882704201d411f200912707b3543fb

Timestamp of repository imaging: Sat, 13 Jun 2020 18:23:16 +0000
Head commit of repository imaging: b2685546f02ac9b9a8cd1364fcccb2228c2392e7

Timestamp of repository java: Sat, 13 Jun 2020 18:22:34 +0000
Head commit of repository java: 10bfe44119784b4a1802c4299eca4a8519831530

Timestamp of repository junkdrawer: Sat, 13 Jun 2020 18:23:08 +0000
Head commit of repository junkdrawer: d5816d6918385a1f15fd097bfd24d92aee7e1a75

Timestamp of repository kde: Sun, 14 Jun 2020 00:05:19 +0000
Head commit of repository kde: 108e90f9d560f20bf6a9a6a138e905aa8aaab8c9

Timestamp of repository linuxunderground-overlay: Sat, 13 Jun 2020 18:23:41 +0000
Head commit of repository linuxunderground-overlay: 4d38dd71713eb22eb12622e462fcce44ccb4293b

Timestamp of repository lto-overlay: Sat, 13 Jun 2020 18:23:36 +0000
Head commit of repository lto-overlay: 29140920ad73bb0dfdab7990622c2f9918a60dc0

Timestamp of repository lua: Sat, 13 Jun 2020 18:22:40 +0000
Head commit of repository lua: f9c709a7393cfc53d00db1e4bc2d59a3a2bda7e7

Timestamp of repository matrix: Sat, 13 Jun 2020 18:23:33 +0000
Head commit of repository matrix: e827ab83841fb9be897028058f7fa56ad52ebe27

Timestamp of repository megacoffee: Sat, 13 Jun 2020 18:23:58 +0000
Head commit of repository megacoffee: 8128f5acb9996c3a85485c1d248f3cd7e1e68708

Timestamp of repository mozilla: Sat, 13 Jun 2020 18:22:43 +0000
Head commit of repository mozilla: 0e2097f7be451df6d84f05c8c06711471249eed8

Timestamp of repository multilib-portage: Sat, 13 Jun 2020 18:22:43 +0000
Head commit of repository multilib-portage: 79de988a140ea42b3255f06635a4c2c3eb9424c2

Timestamp of repository mv: Sat, 13 Jun 2020 18:22:44 +0000
Head commit of repository mv: e6ed19a332171201266853dcd1b0080151e1f4c4

Timestamp of repository mysql: Sat, 13 Jun 2020 18:22:46 +0000
Head commit of repository mysql: f60fb410f1658ed9bde4fb99c6311ae868aa3ae6

Timestamp of repository pentoo: Sat, 13 Jun 2020 18:22:47 +0000
Head commit of repository pentoo: 59ef4375d791ecbf3d9ef637294a00f791567b5a

Timestamp of repository perl-experimental: Sat, 13 Jun 2020 18:22:47 +0000
Head commit of repository perl-experimental: 0eb62283ef7a99296ab08ef7ce1ac084fbf13615

Timestamp of repository plex-overlay: Sat, 13 Jun 2020 18:23:59 +0000
Head commit of repository plex-overlay: b76254b3d2ea239801206c72bc523416e9130aab

Timestamp of repository python: Sat, 13 Jun 2020 18:23:08 +0000
Head commit of repository python: 64ce75ad1184d70b1fff8ac72489d367f10d6ba1

Timestamp of repository qgp: Sat, 13 Jun 2020 18:23:49 +0000
Head commit of repository qgp: a84312813b1f297ff65fead9733a454e78736695

Timestamp of repository qt: Sat, 13 Jun 2020 18:22:50 +0000
Head commit of repository qt: f24623facf00560e0572d37e819200dbde55d216

Timestamp of repository quarks: Sat, 13 Jun 2020 18:22:50 +0000
Head commit of repository quarks: 7691e63aab57335d3142ab37f5a577357cdf54c0

Timestamp of repository qwin-overlay: Sat, 13 Jun 2020 18:22:51 +0000
Head commit of repository qwin-overlay: d5f09aec327cccaa513d0d34c4815a0b509bf811

Timestamp of repository ricerlay: Sat, 13 Jun 2020 18:23:49 +0000
Head commit of repository ricerlay: 43b6240c57e958c6ea93713e486ef6e0db9a1e09

Timestamp of repository ruby: Sat, 13 Jun 2020 18:22:52 +0000
Head commit of repository ruby: b1f48f69380d1a13dee908db5616e4c630fad937

Timestamp of repository rust: Sat, 13 Jun 2020 18:23:50 +0000
Head commit of repository rust: 1d45fed550b026315b3b4ec4f6b042533d8cc834

Timestamp of repository sabayon: Sat, 13 Jun 2020 18:24:02 +0000
Head commit of repository sabayon: db2ed28eef66b9d0304faaa00e5cfea36189fa63

Timestamp of repository science: Sat, 13 Jun 2020 18:24:03 +0000
Head commit of repository science: d95bb529b051aeed975830c7f700a47b05601efc

Timestamp of repository scrill: Sat, 13 Jun 2020 18:22:55 +0000
Head commit of repository scrill: 9e48e8cdc7952c621aad7c4fd717939e91ea65e9

Timestamp of repository snapd: Sat, 13 Jun 2020 18:23:57 +0000
Head commit of repository snapd: 3d116d774c7ca9c7478b807f58a24d67966b8c2e

Timestamp of repository soltys: Sat, 13 Jun 2020 18:23:46 +0000
Head commit of repository soltys: f083f59032a6c506cd797369b807b009d87c9a99

Timestamp of repository steam-overlay: Sat, 13 Jun 2020 18:22:56 +0000
Head commit of repository steam-overlay: 53d737f1dfb6837da49b92dbc31d7cbc86ad09e8

Timestamp of repository toolchain: Sat, 22 Feb 2020 10:05:46 +0000
Head commit of repository toolchain: 523f25097ac0d12a0629aeee6cc06073949f9ae1

Timestamp of repository torbrowser: Sat, 13 Jun 2020 18:22:59 +0000
Head commit of repository torbrowser: a8f0c4afb2a7e35ced2b6e3420a4877d901f08ce

Timestamp of repository webos: Sat, 13 Jun 2020 18:23:03 +0000
Head commit of repository webos: 9a977a79ec72b23a035b48b79c2303dbcfc80ac9

Timestamp of repository what4-java: Sat, 13 Jun 2020 18:23:49 +0000
Head commit of repository what4-java: 52c0dd1ef497a652ee61d77a8d1b9e852de6cef3

Timestamp of repository x11: Sat, 13 Jun 2020 18:23:03 +0000
Head commit of repository x11: 066c3925ad29ada56bdcb1b4961abf48e9ad7333

Timestamp of repository yoreek: Sat, 13 Jun 2020 18:23:04 +0000
Head commit of repository yoreek: 2ff990663d5302237b6bc66fe68b68ab8b58e5cb

sh bash 5.0_p17
ld GNU ld (Gentoo 2.34 p4) 2.34.0
ccache version 3.7.9 [disabled]
app-shells/bash:          5.0_p17::gentoo
dev-java/java-config:     2.2.0-r4::gentoo
dev-lang/perl:            5.30.3-r1::gentoo
dev-lang/python:          2.7.18-r100::lto-overlay, 3.7.7-r3::lto-overlay, 3.8.3-r1::lto-overlay
dev-util/ccache:          3.7.9::gentoo
dev-util/cmake:           3.17.3::gentoo
dev-util/pkgconfig:       0.29.2::gentoo
sys-apps/baselayout:      2.7::gentoo
sys-apps/sandbox:         2.20::gentoo
sys-devel/autoconf:       2.69-r5::gentoo
sys-devel/automake:       1.16.2::gentoo
sys-devel/binutils:       2.34-r1::gentoo
sys-devel/gcc:            10.1.0-r1::gentoo, 11.0.0_pre9999::x-portage
sys-devel/gcc-config:     2.3::gentoo
sys-devel/libtool:        2.4.6-r6::gentoo
sys-devel/make:           4.3::gentoo
sys-kernel/linux-headers: 5.7::gentoo (virtual/os-headers)
sys-libs/glibc:           2.31-r5::gentoo
Repositories:

gentoo
    location: /usr/portage
    sync-type: git
    sync-uri: https://github.com/gentoo-mirror/gentoo.git
    priority: -1000
    sync-git-clone-extra-opts: -b master
    sync-git-verify-commit-signature: true

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
APACHE2_MODULES="actions alias auth_basic authn_alias authn_anon authn_core authn_dbm authn_default authn_file authz_core authz_dbm authz_default authz_groupfile authz_host authz_owner authz_user autoindex cache cgi cgid dav dav_fs dav_lock deflate dir disk_cache env expires ext_filter file_cache filter headers include info log_config logio mem_cache mime mime_magic negotiation rewrite setenvif socache_shmcb speling status unique_id unixd userdir usertrack vhost_alias"
ARCH="amd64"
ARCHLINUX_RICE="-fbranch-target-load-optimize2 -fcx-fortran-rules -fipa-pta -fno-enforce-eh-specs -fnothrow-opt -fno-var-tracking-assignments -freschedule-modulo-scheduled-loops -fsched-pressure -fsched-spec-load -fsched-spec-load-dangerous -fsched-stalled-insns=0 -fsched2-use-superblocks -fselective-scheduling -fselective-scheduling2 -fsel-sched-pipelining -fsel-sched-pipelining-outer-loops -ftree-lrs -maccumulate-outgoing-args -fmerge-all-constants"
AUTOCLEAN="yes"
BINPKG_COMPRESS=""
BINPKG_COMPRESS_FLAGS=""
BOOTSTRAP_USE="unicode internal-glib pkg-config split-usr python_targets_python3_7 python_targets_python2_7 multilib systemd udev systemd udev"
BROOT=""
CALLIGRA_FEATURES="karbon sheets words"
CBUILD="x86_64-pc-linux-gnu"
CCACHE_DIR="/tmp/ccache"
CFLAGS="-march=znver2 -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
CFLAGS_amd64="-m64"
CFLAGS_x32="-mx32"
CFLAGS_x86="-m32"
CHOST="x86_64-pc-linux-gnu"
CHOST_amd64="x86_64-pc-linux-gnu"
CHOST_x32="x86_64-pc-linux-gnux32"
CHOST_x86="i686-pc-linux-gnu"
CLEAN_DELAY="5"
CMAKE_CXX_COMPILER="command g++ -O2 -pipe"
CMAKE_C_COMPILER="command gcc -march=znver2 -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
CMAKE_LINKER="command ld -Wl,-O1 -Wl,--as-needed"
CMAKE_MAKEFILE_GENERATOR="ninja"
COLLECTD_PLUGINS="df interface irq load memory rrdtool swap syslog"
COLLISION_IGNORE="/lib/modules/*"
COLUMNS="237"
CONFIG_PROTECT="/etc /usr/share/gnupg/qualified.txt"
CONFIG_PROTECT_MASK="/etc/ca-certificates.conf /etc/env.d /etc/fonts/fonts.conf /etc/gconf /etc/gentoo-release /etc/php/apache2-php7.4/ext-active/ /etc/php/cgi-php7.4/ext-active/ /etc/php/cli-php7.4/ext-active/ /etc/revdep-rebuild /etc/sandbox.d /etc/terminfo"
CPU_FLAGS_X86="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sha sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3"
CXXFLAGS="-march=znver2 -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
DEFAULT_ABI="amd64"
DEVIRTLTO="-fdevirtualize-at-ltrans"
DISTDIR="/usr/portage/distfiles"
EDITOR="nano"
ELIBC="glibc"
EMERGE_DEFAULT_OPTS="--ask --ask-enter-invalid --autounmask-backtrack=y --autounmask=y --binpkg-respect-use=y --buildpkg-exclude 'virtual/* sys-kernel/*-sources' --buildpkg=y --complete-graph=y --keep-going=y --quiet-fail=y --verbose --verbose-conflicts --with-bdeps=y --with-test-deps=n"
EMERGE_WARNING_DELAY="10"
ENV_UNSET="DBUS_SESSION_BUS_ADDRESS DISPLAY GOBIN GOPATH PERL5LIB PERL5OPT PERLPREFIX PERL_CORE PERL_MB_OPT PERL_MM_OPT XAUTHORITY XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_RUNTIME_DIR"
EPREFIX=""
EROOT="/"
ESYSROOT="/"
FCFLAGS="-march=znver2 -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
FEATURES="assume-digests binpkg-docompress binpkg-dostrip binpkg-logs buildpkg cgroup compress-index config-protect-if-modified distlocks ebuild-locks fixlafiles ipc-sandbox merge-sync multilib-strict network-sandbox news nodoc parallel-fetch pid-sandbox preserve-libs qa-unresolved-soname-deps sandbox sfperms strict strict-keepdir unknown-features-warn unmerge-logs unmerge-orphans userfetch userpriv usersandbox usersync xattr"
FETCHCOMMAND="wget -t 3 -T 60 --passive-ftp -O "${DISTDIR}/${FILE}" "${URI}""
FETCHCOMMAND_RSYNC="rsync -LtvP "${URI}" "${DISTDIR}/${FILE}""
FETCHCOMMAND_SFTP="bash -c "x=\${2#sftp://} ; host=\${x%%/*} ; port=\${host##*:} ; host=\${host%:*} ; [[ \${host} = \${port} ]] && port= ; eval \"declare -a ssh_opts=(\${3})\" ; exec sftp \${port:+-P \${port}} \"\${ssh_opts[@]}\" \"\${host}:/\${x#*/}\" \"\$1\"" sftp "${DISTDIR}/${FILE}" "${URI}" "${PORTAGE_SSH_OPTS}""
FETCHCOMMAND_SSH="bash -c "x=\${2#ssh://} ; host=\${x%%/*} ; port=\${host##*:} ; host=\${host%:*} ; [[ \${host} = \${port} ]] && port= ; exec rsync --rsh=\"ssh \${port:+-p\${port}} \${3}\" -avP \"\${host}:/\${x#*/}\" \"\$1\"" rsync "${DISTDIR}/${FILE}" "${URI}" "${PORTAGE_SSH_OPTS}""
FFLAGS="-march=znver2 -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin"
FLTO="-flto=12"
GCC_SPECS=""
GENTOO_MIRRORS="https://ftp.fau.de/gentoo"
GPSD_PROTOCOLS="aivdm ashtech earthmate evermore fv18 garmin garmintxt gpsclock greis isync itrax mtk3301 navcom nmea ntrip oceanserver oldstyle oncore rtcm104v2 rtcm104v3 sirf skytraq superstar2 timing tnt tripmate tsip ublox ubx"
GRAPHITE="-fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize"
GRUB_PLATFORMS="pc efi-64"
HOME="/root"
IBPATH="/usr/sbin"
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
LDFLAGS="-Wl,-O1,--sort-common,--as-needed,-z,norelro,-z,now,-lgomp,-lpthread"
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
LINES="56"
LINGUAS="en en_US"
LLVM_TARGETS="BPF NVPTX X86 AArch64 ARM WebAssembly XCore"
LOGNAME="root"
LS_COLORS="rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.cfg=00;32:*.conf=00;32:*.diff=00;32:*.doc=00;32:*.ini=00;32:*.log=00;32:*.patch=00;32:*.pdf=00;32:*.ps=00;32:*.tex=00;32:*.txt=00;32:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:"
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
OLDPWD="/home/gnum/src/github/gentoo-optimized/tmp"
PAGER="less"
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/dell/srvadmin/bin:/opt/dell/srvadmin/sbin"
PHP_TARGETS="php7-2"
PKGDIR="/usr/portage/packages"
PORTAGE_ARCHLIST="alpha amd64 amd64-linux arm arm-linux arm64 arm64-linux hppa ia64 m68k m68k-mint mips ppc ppc-aix ppc-macos ppc64 ppc64-linux riscv s390 sparc sparc-solaris sparc64-solaris x64-cygwin x64-macos x64-solaris x64-winnt x86 x86-cygwin x86-linux x86-macos x86-solaris x86-winnt"
PORTAGE_BINHOST="http://packages.gentooexperimental.org/packages/amd64-unstable/"
PORTAGE_BIN_PATH="/usr/lib/portage/python3.8"
PORTAGE_BUNZIP2_COMMAND="bunzip2"
PORTAGE_COMPRESS="bzip2"
PORTAGE_COMPRESS_EXCLUDE_SUFFIXES="css gif htm[l]? jp[e]?g js pdf png"
PORTAGE_COMPRESS_FLAGS="-9vk -p12 -l12 -m1024"
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
PORTAGE_IONICE_COMMAND="ionice -c 3 -p ${PID}"
PORTAGE_LOGDIR_CLEAN="find "${PORTAGE_LOGDIR}" -type f ! -name "summary.log*" -mtime +7 -delete"
PORTAGE_NICENESS="19"
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
POSTGRES_TARGETS="postgres11"
PROFILE_ONLY_VARIABLES="ARCH ELIBC IUSE_IMPLICIT KERNEL USERLAND USE_EXPAND_IMPLICIT USE_EXPAND_UNPREFIXED USE_EXPAND_VALUES_ARCH USE_EXPAND_VALUES_ELIBC USE_EXPAND_VALUES_KERNEL USE_EXPAND_VALUES_USERLAND"
PS1="\[\033]0;\u@\h:\w\007\]\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] "
PWD="/home/gnum/src/github/gentoo-optimized"
PYTHONDONTWRITEBYTECODE="1"
PYTHON_SINGLE_TARGET="python3_8"
PYTHON_TARGETS="python3_8"
QEMU_SOFTMMU_TARGETS="x86_64 aarch64 arm"
QEMU_USER_TARGETS="x86_64 aarch64 arm"
QUICKPKG_DEFAULT_OPTS="--include-config=y"
RESUMECOMMAND="wget -c -t 3 -T 60 --passive-ftp -O "${DISTDIR}/${FILE}" "${URI}""
RESUMECOMMAND_RSYNC="rsync -LtvP "${URI}" "${DISTDIR}/${FILE}""
RESUMECOMMAND_SSH="bash -c "x=\${2#ssh://} ; host=\${x%%/*} ; port=\${host##*:} ; host=\${host%:*} ; [[ \${host} = \${port} ]] && port= ; exec rsync --rsh=\"ssh \${port:+-p\${port}} \${3}\" -avP \"\${host}:/\${x#*/}\" \"\$1\"" rsync "${DISTDIR}/${FILE}" "${URI}" "${PORTAGE_SSH_OPTS}""
ROOT="/"
ROOTPATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/10/bin"
RPMDIR="/var/cache/rpm"
RUBY_TARGETS="ruby27"
RUSTFLAGS="-Ctarget-cpu=native"
SAFER_FAST_MATH="-fno-signed-zeros -fno-trapping-math -fassociative-math -freciprocal-math -fno-math-errno -ffinite-math-only -fno-rounding-math -fno-signaling-nans -fcx-limited-range -fexcess-precision=fast"
SAFER_UNSAFE_MATH_OPTS="-fno-signed-zeros -fno-trapping-math -fassociative-math -freciprocal-math"
SAFEST_FAST_MATH="-fno-math-errno -fno-trapping-math"
SEMINTERPOS="-fno-semantic-interposition"
SHELL="/bin/bash"
SHLVL="2"
SSH_CLIENT="74.70.75.98 53470 22"
SSH_CONNECTION="74.70.75.98 53470 95.217.117.234 22"
SSH_TTY="/dev/pts/0"
SYMLINK_LIB="no"
SYSROOT="/"
TERM="xterm-256color"
TWISTED_DISABLE_WRITING_OF_PLUGIN_CACHE="1"
UNINSTALL_IGNORE="/lib/modules/* /var/run /var/lock"
USE="X aac acl acpi alsa amd64 asm avx bash-completion bcache berkdb blksha1 bluray boost branding bzip2 cairo caps ccache cflags cli contrib corefonts crypt curl custom-cflags custom-optimization custom-tune cxx daemon dev-libs dri dri3 dts encode eselect exif expat fbcon ffmpeg flac flambda fontconfig fortran fpm gd gdbm gif git gmp go gold gpm graphite guile guile2 gzip handbook hddtemp hexpat hscolour hwloc iconv icu idn initramfs inotify jemalloc jpeg jpeg2k json jsonc lame lcms libnotify libsamplerate libssh libtirpc lm-sensors lm_sensors lock lrzip lto lv4 lz4 lzma lzo mad matroska mdadm mime mmap mmx mmxext mng mp3 mp4 mpeg mpi multilib multitarget ncurses nlopt nls nptl nscd nvidia offensive offload ogg oil openal opencl opengl openmp optimised-mixer optimizations optimize optimize-gmp orc override-flagomatic pam pango pch pclmul pcre pcre-jit pcre16 pcre2 pcre32 pdf perl pgo pic plugins png policykit popcnt ppds profile profiler profiling pypy3 python r_suggests_spacetime rar rdesktop readline reflex-optimizer resize-optimization sctp sdl seccomp session smp sndfile snmp sockets socks5 sound source spacetime spell split-usr sqlite ssh ssl startup-notification strong-optimization svg syslog system-av1 system-bzip2 system-cairo system-ffmpeg system-harfbuzz system-icu system-jpeg system-libevent system-libvpx system-libwebp system-lua system-openssl system-sqlite system-zlib systemd systemtap szip tcl tcmalloc tcpd telemetry text theora threads tidy tiff tk tools truetype twolame udev udisks unicode unzip upnp upnp-av upower usr-portage util utils uvm vaapi vdo vdpau vhosts vim vim-syntax vorbis vpx vulkan webkit webp webui wmf wxwidgets x264 x265 xattr xcb xcomposite xface xft xine xinetd xla xml xmlrpc xmpp xorg xpm xscreensaver xv xvid xz zeroconf zip zlib zsh zsh-completion zstd" ABI_X86="64" ADA_TARGET="gnat_2018" ALSA_CARDS="hda-intel nvidia nv dummy" APACHE2_MODULES="actions alias auth_basic authn_alias authn_anon authn_core authn_dbm authn_default authn_file authz_core authz_dbm authz_default authz_groupfile authz_host authz_owner authz_user autoindex cache cgi cgid dav dav_fs dav_lock deflate dir disk_cache env expires ext_filter file_cache filter headers include info log_config logio mem_cache mime mime_magic negotiation rewrite setenvif socache_shmcb speling status unique_id unixd userdir usertrack vhost_alias" CALLIGRA_FEATURES="karbon sheets words" COLLECTD_PLUGINS="df interface irq load memory rrdtool swap syslog" CPU_FLAGS_X86="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sha sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3" ELIBC="glibc" GPSD_PROTOCOLS="aivdm ashtech earthmate evermore fv18 garmin garmintxt gpsclock greis isync itrax mtk3301 navcom nmea ntrip oceanserver oldstyle oncore rtcm104v2 rtcm104v3 sirf skytraq superstar2 timing tnt tripmate tsip ublox ubx" GRUB_PLATFORMS="pc efi-64" INPUT_DEVICES="keyboard mouse evdev libinput" KERNEL="linux" L10N="en en_US en-US" LCD_DEVICES="bayrad cfontz cfontz633 glk hd44780 lb216 lcdm001 mtxorb ncurses text" LIBREOFFICE_EXTENSIONS="presenter-console presenter-minimizer" LLVM_TARGETS="BPF NVPTX X86 AArch64 ARM WebAssembly XCore" NGINX_MODULES_HTTP="access fastcgi gzip proxy rewrite" OFFICE_IMPLEMENTATION="libreoffice" PHP_TARGETS="php7-2" POSTGRES_TARGETS="postgres11" PYTHON_SINGLE_TARGET="python3_8" PYTHON_TARGETS="python3_8" QEMU_SOFTMMU_TARGETS="x86_64 aarch64 arm" QEMU_USER_TARGETS="x86_64 aarch64 arm" RUBY_TARGETS="ruby27" USERLAND="GNU" VIDEO_CARDS="nv nvidia vesa fbdev nouveau dummy v4l" XTABLES_ADDONS="account chaos condition delude dhcpmac fuzzy geoip iface ipmark ipp2p ipset ipv4options length2 logmark lscan pknock psd quota2 rawnat steal sysrq tarpit tee"
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
XDG_RUNTIME_DIR="/run/user/0"
XDG_SESSION_CLASS="user"
XDG_SESSION_ID="c23"
XDG_SESSION_TYPE="tty"
XTABLES_ADDONS="account chaos condition delude dhcpmac fuzzy geoip iface ipmark ipp2p ipset ipv4options length2 logmark lscan pknock psd quota2 rawnat steal sysrq tarpit tee"
_NO_SSP="-fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check"
```
