# gentoo-optimized

An attempt at an organized and optimized gentoo configuration, including LTO, Graphite, PGO, customized cflags, etc

With credit to: https://github.com/InBetweenNames/gentooLTO

'emerge --info' output:

```
Portage 2.3.101 (python 3.8.3-final-0, default/linux/amd64/17.1/systemd, gcc-11.0.0, glibc-2.31-r5, 5.4.36 x86_64)

System uname: Linux-5.4.36-x86_64-AMD_Ryzen_5_3600_6-Core_Processor-with-glibc2.2.5
KiB Mem:    65821220 total,   4815448 free
KiB Swap:          0 total,         0 free
Timestamp of repository gentoo: Thu, 18 Jun 2020 05:35:18 +0000
Head commit of repository gentoo: 4856e50e718c17736d59228808ee8690f6c40834

Timestamp of repository FireBurn: Wed, 17 Jun 2020 20:05:14 +0000
Head commit of repository FireBurn: 5c80db42911ea28786ca855144f0d5588611cde6

Timestamp of repository R_Overlay: Thu, 18 Jun 2020 05:35:14 +0000
Head commit of repository R_Overlay: d1439534767a81b6bac77698a346a007d84b3ac0

Timestamp of repository ag-ops: Sun, 14 Jun 2020 11:53:17 +0000
Head commit of repository ag-ops: dce562fc73303cff29ef848470f8cad1eb4b13f7

Timestamp of repository ago: Sun, 14 Jun 2020 11:51:49 +0000
Head commit of repository ago: 3725e7ae4bf43480221ac8294cb05ab8cb484c6d

Timestamp of repository aluco: Sun, 14 Jun 2020 11:51:49 +0000
Head commit of repository aluco: 9951b24e17a184ce95d62b27fda46fb02accde3b

Timestamp of repository apurkrt: Sun, 14 Jun 2020 11:53:32 +0000
Head commit of repository apurkrt: dc8c91fd55bde4177eae92a4520f751d0624ff9b

Timestamp of repository archenroot: Sun, 14 Jun 2020 11:53:27 +0000
Head commit of repository archenroot: 93b5394ff310996170c2de24cec97590236e80f2

Timestamp of repository audio-overlay: Sun, 14 Jun 2020 11:53:05 +0000
Head commit of repository audio-overlay: f70f41d063272c8672ea1f590075d06d5be2c7d5

Timestamp of repository awesome: Sun, 14 Jun 2020 11:51:53 +0000
Head commit of repository awesome: ee16fd1ff99fe11eb1e6341c74a7bcf053b86595

Timestamp of repository bitcoin: Wed, 17 Jun 2020 14:05:13 +0000
Head commit of repository bitcoin: e75193af8f0cf3514788a98bedda4e8100421995

Timestamp of repository bleeding-edge: Sun, 14 Jun 2020 11:51:54 +0000
Head commit of repository bleeding-edge: b619a98cd103e74b4f7f99f2d23ac80eb857a3b3

Timestamp of repository brave-overlay: Sun, 14 Jun 2020 11:53:19 +0000
Head commit of repository brave-overlay: f753d20e7f165bdb28b25c9e3af8de9f15c30d70

Timestamp of repository cg: Tue, 16 Jun 2020 11:35:28 +0000
Head commit of repository cg: 5fdae27e29da499a35d23710c20e1832eb87a759

Timestamp of repository crossdev: Sun, 14 Jun 2020 11:52:39 +0000
Head commit of repository crossdev: 7af1d2fa160825294eaa9c8b937e23edf5cee10b

Timestamp of repository decent-im: Sun, 14 Jun 2020 11:53:10 +0000
Head commit of repository decent-im: d9655eaa9109e1477344eac5a4cfb62027364607

Timestamp of repository dlang: Sun, 14 Jun 2020 11:51:58 +0000
Head commit of repository dlang: f74f580500806e0de4cc12b2341ccc418fbb7931

Timestamp of repository docker: Sun, 14 Jun 2020 11:51:58 +0000
Head commit of repository docker: 99e4b6d504ac4bb7c7c98fd86065ec2bf03c7877

Timestamp of repository dotnet: Tue, 16 Jun 2020 07:05:40 +0000
Head commit of repository dotnet: 3b5fe061c0902df79ca035c8820883a79fd794e9

Timestamp of repository drdim: Sun, 14 Jun 2020 11:51:58 +0000
Head commit of repository drdim: 92d2592d800af81f6e6939f4af4d53b11ca100c5

Timestamp of repository edgets: Sun, 14 Jun 2020 11:53:36 +0000
Head commit of repository edgets: d00207d60c83caaf7d88392d7a19832c08326441

Timestamp of repository ethereum: Sun, 14 Jun 2020 11:53:35 +0000
Head commit of repository ethereum: bc5e3bcbec925169b441c07a04bf5fb259b1a763

Timestamp of repository ext-devlibs: Sun, 14 Jun 2020 11:52:02 +0000
Head commit of repository ext-devlibs: e6a97900dabd4e20a503279954053b469dae0fd2

Timestamp of repository fordfrog: Wed, 17 Jun 2020 18:35:11 +0000
Head commit of repository fordfrog: 90d655ed00471a4362b5d85a0b5a6353fa4c0375

Timestamp of repository gitlab: Sun, 14 Jun 2020 11:52:06 +0000
Head commit of repository gitlab: 09df03e9f66b49680b5aaa208373abaf48bd670b

Timestamp of repository gnome: Sun, 14 Jun 2020 11:52:06 +0000
Head commit of repository gnome: 08f4d60fb224f1dc858710bcd5a3d3410cf45e5c

Timestamp of repository go-overlay: Sun, 14 Jun 2020 11:52:39 +0000
Head commit of repository go-overlay: 7c99a4ed776d63599ef57fee1cf73cab62bd8c4a

Timestamp of repository graaff: Thu, 18 Jun 2020 04:35:18 +0000
Head commit of repository graaff: f83246c8da73c65dd3b50d724396dc97960f7be3

Timestamp of repository haskell: Thu, 18 Jun 2020 00:05:20 +0000
Head commit of repository haskell: 4cc7576598bd3470f03abb1457db53758ef2102f

Timestamp of repository hexedit-overlay: Sun, 14 Jun 2020 11:52:47 +0000
Head commit of repository hexedit-overlay: b726bb1fdb2aa2b424574be3799012625c84743a

Timestamp of repository imaging: Sun, 14 Jun 2020 11:52:47 +0000
Head commit of repository imaging: 868b3c54cf86f452a2c510a30649f514f1a78d40

Timestamp of repository java: Sun, 14 Jun 2020 11:52:09 +0000
Head commit of repository java: 3428ddc0fdd799c4b23bcc8d87d63a000b12f2dd

Timestamp of repository junkdrawer: Sun, 14 Jun 2020 11:52:39 +0000
Head commit of repository junkdrawer: e32ebff5b0a9870f0303e10b87e02beae6a6a24d

Timestamp of repository kde: Wed, 17 Jun 2020 16:35:30 +0000
Head commit of repository kde: 6752e14612d4b82ac0985f27d9a3eb328f309e07

Timestamp of repository linuxunderground-overlay: Wed, 17 Jun 2020 18:35:11 +0000
Head commit of repository linuxunderground-overlay: a112c4e4d8d84aac8e7b01727a694e3dd4c63692

Timestamp of repository lto-overlay: Sun, 14 Jun 2020 11:53:07 +0000
Head commit of repository lto-overlay: 02c857710889512b63d93b54847e0e79c60c3355

Timestamp of repository lua: Sun, 14 Jun 2020 11:52:13 +0000
Head commit of repository lua: 5f4f373716e9b994804d49ebe076e9c3140e1004

Timestamp of repository matrix: Sun, 14 Jun 2020 11:53:04 +0000
Head commit of repository matrix: 052f547b67fd6f76fb0e901d4f546f7585ec022d

Timestamp of repository megacoffee: Sun, 14 Jun 2020 11:53:30 +0000
Head commit of repository megacoffee: 0402645584141ede72f92f4abb22920d01ce2296

Timestamp of repository mozilla: Sun, 14 Jun 2020 11:52:16 +0000
Head commit of repository mozilla: d59d1d699f700d628f12c27f720544a07292511a

Timestamp of repository multilib-portage: Sun, 14 Jun 2020 11:52:17 +0000
Head commit of repository multilib-portage: b33bdcccaa355756145ca569846ab90ff73fe355

Timestamp of repository mv: Sun, 14 Jun 2020 12:35:11 +0000
Head commit of repository mv: 8c6f6956e9e22e4eeebd19467497210691a07ea4

Timestamp of repository mysql: Sun, 14 Jun 2020 11:52:17 +0000
Head commit of repository mysql: 9fdd78c3fd1db0458d77084000330f91e3d8f612

Timestamp of repository pentoo: Thu, 18 Jun 2020 03:05:18 +0000
Head commit of repository pentoo: ff355f7ecd6172c11905aee5933d47327ff59a40

Timestamp of repository perl-experimental: Sun, 14 Jun 2020 11:52:19 +0000
Head commit of repository perl-experimental: 9f6be50773ad66622cc513574d70925c9b3878c3

Timestamp of repository plex-overlay: Sun, 14 Jun 2020 11:53:31 +0000
Head commit of repository plex-overlay: a14cfbe82dda547aff88fe0af780f232b23c0b92

Timestamp of repository python: Sun, 14 Jun 2020 11:52:40 +0000
Head commit of repository python: a5b2492ab146c100274e648d03f837385f2bdc6e

Timestamp of repository qgp: Sun, 14 Jun 2020 11:53:21 +0000
Head commit of repository qgp: 21367401f3ed93b975916d59b10d4495d1db9b15

Timestamp of repository qt: Sun, 14 Jun 2020 22:05:23 +0000
Head commit of repository qt: 9b660af4a9d0d0a4a5a77601b284b877c8e4b5ce

Timestamp of repository quarks: Sun, 14 Jun 2020 11:52:22 +0000
Head commit of repository quarks: 1445e75e2475b00729fde3738761b6bae44a78d9

Timestamp of repository qwin-overlay: Sun, 14 Jun 2020 11:52:22 +0000
Head commit of repository qwin-overlay: 7555880fd098d46987ac303318fd6b103d73c228

Timestamp of repository ricerlay: Sun, 14 Jun 2020 11:53:22 +0000
Head commit of repository ricerlay: 8d51550a6a37f03c072c13ef2dd0d2f15ae95d78

Timestamp of repository ruby: Sun, 14 Jun 2020 11:52:24 +0000
Head commit of repository ruby: 79baa4b3bc6a5a73470eeab3115ae67a25f4e6f2

Timestamp of repository rust: Sun, 14 Jun 2020 11:53:22 +0000
Head commit of repository rust: d3e849558925a627d9ee337adb9d365a550423f6

Timestamp of repository sabayon: Tue, 16 Jun 2020 19:35:07 +0000
Head commit of repository sabayon: 07d05bdce1b5f5cfedc769246674708e711eb710

Timestamp of repository science: Sun, 14 Jun 2020 11:53:40 +0000
Head commit of repository science: 3ca88070018edbfff6bf9f4c76be53765f083d3b

Timestamp of repository scrill: Sun, 14 Jun 2020 11:52:26 +0000
Head commit of repository scrill: 18fdb0c1a6f69c65d8356b6aec45e904d68afa6e

Timestamp of repository snapd: Sun, 14 Jun 2020 11:53:28 +0000
Head commit of repository snapd: 03d95fafe2338126eed2f44e0791c8a9a4e1b1ed

Timestamp of repository soltys: Sun, 14 Jun 2020 11:53:18 +0000
Head commit of repository soltys: 411dfa0d872fc0df06b2c9bf1b25b311d242006c

Timestamp of repository steam-overlay: Sun, 14 Jun 2020 11:52:28 +0000
Head commit of repository steam-overlay: 69645880077cdc5afa1531ae209f638d49e092f2

Timestamp of repository toolchain: Sat, 22 Feb 2020 10:05:46 +0000
Head commit of repository toolchain: 523f25097ac0d12a0629aeee6cc06073949f9ae1

Timestamp of repository torbrowser: Sun, 14 Jun 2020 11:52:31 +0000
Head commit of repository torbrowser: 05c3b2fb48e447518038d2c9b1bbc30ee49ec4c0

Timestamp of repository webos: Sun, 14 Jun 2020 11:52:35 +0000
Head commit of repository webos: 947b49c10ae7dcbcbc6619ef52776dba30059fd1

Timestamp of repository what4-java: Sun, 14 Jun 2020 11:53:21 +0000
Head commit of repository what4-java: a74a54056bd806f52ad9da1a96ef845c5a2116e0

Timestamp of repository x11: Sun, 14 Jun 2020 11:52:35 +0000
Head commit of repository x11: de989018393a466eb41068c3cd5d4510a66dc111

Timestamp of repository yoreek: Sun, 14 Jun 2020 11:52:36 +0000
Head commit of repository yoreek: 25e36d036a03c53fca107191ac41eeb3e1780778

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
BOOT_CFLAGS="-march=native -O3 -fno-signed-zeros -fno-trapping-math -fassociative-math -freciprocal-math -fno-math-errno -ffinite-math-only -fno-rounding-math -fno-signaling-nans -fcx-limited-range -fexcess-precision=fast -pipe -g0 -fno-common -fgraphite-identity -floop-nest-optimize -fdevirtualize-at-ltrans -fno-semantic-interposition -fno-plt -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -Wl,-O1 -Wl,--as-needed -Wl,--sort-common -Wl,-z -Wl,norelro"
BROOT=""
CALLIGRA_FEATURES="karbon sheets words"
CBUILD="x86_64-pc-linux-gnu"
CCACHE_DIR="/tmp/ccache"
CFLAGS="-march=native -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fbranch-target-load-optimize2 -fcx-fortran-rules -fno-enforce-eh-specs -fnothrow-opt -fno-var-tracking-assignments -freschedule-modulo-scheduled-loops -fsched-pressure -fsched-spec-load -fsched-spec-load-dangerous -fsched-stalled-insns=0 -fsched2-use-superblocks -fselective-scheduling -fselective-scheduling2 -fsel-sched-pipelining -fsel-sched-pipelining-outer-loops -ftree-lrs -maccumulate-outgoing-args -fmerge-all-constants -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -Wl,-O1 -Wl,--as-needed -Wl,--sort-common -Wl,-z -Wl,norelro -Wl,-z,max-page-size=0x1000 -lgomp -lpthread -s"
CFLAGS_amd64="-m64"
CFLAGS_x32="-mx32"
CFLAGS_x86="-m32"
CHOST="x86_64-pc-linux-gnu"
CHOST_amd64="x86_64-pc-linux-gnu"
CHOST_x32="x86_64-pc-linux-gnux32"
CHOST_x86="i686-pc-linux-gnu"
CLEAN_DELAY="5"
CMAKE_CXX_COMPILER="command g++ -O2 -pipe"
CMAKE_C_COMPILER="command gcc -march=native -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fbranch-target-load-optimize2 -fcx-fortran-rules -fno-enforce-eh-specs -fnothrow-opt -fno-var-tracking-assignments -freschedule-modulo-scheduled-loops -fsched-pressure -fsched-spec-load -fsched-spec-load-dangerous -fsched-stalled-insns=0 -fsched2-use-superblocks -fselective-scheduling -fselective-scheduling2 -fsel-sched-pipelining -fsel-sched-pipelining-outer-loops -ftree-lrs -maccumulate-outgoing-args -fmerge-all-constants -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -Wl,-O1 -Wl,--as-needed -Wl,--sort-common -Wl,-z -Wl,norelro -Wl,-z,max-page-size=0x1000 -lgomp -lpthread -s"
CMAKE_LINKER="command ld -march=native -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fbranch-target-load-optimize2 -fcx-fortran-rules -fno-enforce-eh-specs -fnothrow-opt -fno-var-tracking-assignments -freschedule-modulo-scheduled-loops -fsched-pressure -fsched-spec-load -fsched-spec-load-dangerous -fsched-stalled-insns=0 -fsched2-use-superblocks -fselective-scheduling -fselective-scheduling2 -fsel-sched-pipelining -fsel-sched-pipelining-outer-loops -ftree-lrs -maccumulate-outgoing-args -fmerge-all-constants -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -Wl,-O1 -Wl,--as-needed -Wl,--sort-common -Wl,-z -Wl,norelro -Wl,-z,max-page-size=0x1000 -lgomp -lpthread -s"
CMAKE_MAKEFILE_GENERATOR="ninja"
COLLECTD_PLUGINS="df interface irq load memory rrdtool swap syslog"
COLLISION_IGNORE="/lib/modules/*"
COLUMNS="237"
CONFIG_PROTECT="/etc /usr/share/gnupg/qualified.txt"
CONFIG_PROTECT_MASK="/etc/ca-certificates.conf /etc/env.d /etc/fonts/fonts.conf /etc/gconf /etc/gentoo-release /etc/php/apache2-php7.4/ext-active/ /etc/php/cgi-php7.4/ext-active/ /etc/php/cli-php7.4/ext-active/ /etc/revdep-rebuild /etc/sandbox.d /etc/terminfo"
CPU_FLAGS_X86="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sha sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3"
CXXFLAGS="-march=native -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fbranch-target-load-optimize2 -fcx-fortran-rules -fno-enforce-eh-specs -fnothrow-opt -fno-var-tracking-assignments -freschedule-modulo-scheduled-loops -fsched-pressure -fsched-spec-load -fsched-spec-load-dangerous -fsched-stalled-insns=0 -fsched2-use-superblocks -fselective-scheduling -fselective-scheduling2 -fsel-sched-pipelining -fsel-sched-pipelining-outer-loops -ftree-lrs -maccumulate-outgoing-args -fmerge-all-constants -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -Wl,-O1 -Wl,--as-needed -Wl,--sort-common -Wl,-z -Wl,norelro -Wl,-z,max-page-size=0x1000 -lgomp -lpthread -s"
DEFAULT_ABI="amd64"
DEVIRTLTO="-fdevirtualize-at-ltrans"
DISTDIR="/usr/portage/distfiles"
EDITOR="nano"
ELIBC="glibc"
EMERGE_DEFAULT_OPTS="--ask --ask-enter-invalid --autounmask-backtrack=y --autounmask=y --binpkg-respect-use=y --buildpkg-exclude 'virtual/* sys-kernel/*-sources' --buildpkg=y --complete-graph=y --keep-going=y --quiet-fail=y --verbose --verbose-conflicts --with-bdeps=y --with-test-deps=n --jobs 12 --load-average 12.0"
EMERGE_WARNING_DELAY="10"
ENV_UNSET="DBUS_SESSION_BUS_ADDRESS DISPLAY GOBIN GOPATH PERL5LIB PERL5OPT PERLPREFIX PERL_CORE PERL_MB_OPT PERL_MM_OPT XAUTHORITY XDG_CACHE_HOME XDG_CONFIG_HOME XDG_DATA_HOME XDG_RUNTIME_DIR"
EPREFIX=""
EROOT="/"
ESYSROOT="/"
EXTRA_FFMPEG_CONF="--enable-lto"
FCFLAGS="-march=native -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fbranch-target-load-optimize2 -fcx-fortran-rules -fno-enforce-eh-specs -fnothrow-opt -fno-var-tracking-assignments -freschedule-modulo-scheduled-loops -fsched-pressure -fsched-spec-load -fsched-spec-load-dangerous -fsched-stalled-insns=0 -fsched2-use-superblocks -fselective-scheduling -fselective-scheduling2 -fsel-sched-pipelining -fsel-sched-pipelining-outer-loops -ftree-lrs -maccumulate-outgoing-args -fmerge-all-constants -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -Wl,-O1 -Wl,--as-needed -Wl,--sort-common -Wl,-z -Wl,norelro -Wl,-z,max-page-size=0x1000 -lgomp -lpthread -s"
FEATURES="assume-digests binpkg-docompress binpkg-dostrip binpkg-logs buildpkg cgroup compress-index config-protect-if-modified distlocks ebuild-locks fixlafiles ipc-sandbox merge-sync multilib-strict network-sandbox news nodoc parallel-fetch pid-sandbox preserve-libs qa-unresolved-soname-deps sandbox sfperms strict strict-keepdir unknown-features-warn unmerge-logs unmerge-orphans userfetch userpriv usersandbox usersync xattr"
FETCHCOMMAND="wget -t 3 -T 60 --passive-ftp -O "${DISTDIR}/${FILE}" "${URI}""
FETCHCOMMAND_RSYNC="rsync -LtvP "${URI}" "${DISTDIR}/${FILE}""
FETCHCOMMAND_SFTP="bash -c "x=\${2#sftp://} ; host=\${x%%/*} ; port=\${host##*:} ; host=\${host%:*} ; [[ \${host} = \${port} ]] && port= ; eval \"declare -a ssh_opts=(\${3})\" ; exec sftp \${port:+-P \${port}} \"\${ssh_opts[@]}\" \"\${host}:/\${x#*/}\" \"\$1\"" sftp "${DISTDIR}/${FILE}" "${URI}" "${PORTAGE_SSH_OPTS}""
FETCHCOMMAND_SSH="bash -c "x=\${2#ssh://} ; host=\${x%%/*} ; port=\${host##*:} ; host=\${host%:*} ; [[ \${host} = \${port} ]] && port= ; exec rsync --rsh=\"ssh \${port:+-p\${port}} \${3}\" -avP \"\${host}:/\${x#*/}\" \"\$1\"" rsync "${DISTDIR}/${FILE}" "${URI}" "${PORTAGE_SSH_OPTS}""
FFLAGS="-march=native -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fbranch-target-load-optimize2 -fcx-fortran-rules -fno-enforce-eh-specs -fnothrow-opt -fno-var-tracking-assignments -freschedule-modulo-scheduled-loops -fsched-pressure -fsched-spec-load -fsched-spec-load-dangerous -fsched-stalled-insns=0 -fsched2-use-superblocks -fselective-scheduling -fselective-scheduling2 -fsel-sched-pipelining -fsel-sched-pipelining-outer-loops -ftree-lrs -maccumulate-outgoing-args -fmerge-all-constants -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -Wl,-O1 -Wl,--as-needed -Wl,--sort-common -Wl,-z -Wl,norelro -Wl,-z,max-page-size=0x1000 -lgomp -lpthread -s"
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
JAVAC="/etc/java-config-2/current-system-vm/bin/javac"
JAVA_HOME="/etc/java-config-2/current-system-vm"
JDK_HOME="/etc/java-config-2/current-system-vm"
KERNEL="linux"
L10N="en en_US en-US"
LADSPA_PATH="/usr/lib64/ladspa"
LANG="en_US.utf8"
LCD_DEVICES="bayrad cfontz cfontz633 glk hd44780 lb216 lcdm001 mtxorb ncurses text"
LC_MESSAGES="C"
LDFLAGS="-march=native -Ofast -pipe -g0 -fno-common -fgraphite-identity -floop-interchange -floop-nest-optimize -floop-parallelize-all -ftree-parallelize-loops=12 -ftree-vectorize -fdevirtualize-at-ltrans -fipa-pta -fno-semantic-interposition -flto=12 -fno-plt -fbranch-target-load-optimize2 -fcx-fortran-rules -fno-enforce-eh-specs -fnothrow-opt -fno-var-tracking-assignments -freschedule-modulo-scheduled-loops -fsched-pressure -fsched-spec-load -fsched-spec-load-dangerous -fsched-stalled-insns=0 -fsched2-use-superblocks -fselective-scheduling -fselective-scheduling2 -fsel-sched-pipelining -fsel-sched-pipelining-outer-loops -ftree-lrs -maccumulate-outgoing-args -fmerge-all-constants -falign-functions=32 -fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check -fuse-linker-plugin -Wl,-O1 -Wl,--as-needed -Wl,--sort-common -Wl,-z -Wl,norelro -Wl,-z,max-page-size=0x1000 -lgomp -lpthread -s"
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
MANPATH="/etc/java-config-2/current-system-vm/man:/usr/share/gcc-data/x86_64-pc-linux-gnu/11.0.0/man:/usr/share/binutils-data/x86_64-pc-linux-gnu/2.34/man:/etc/java-config-2/current-system-vm/man/:/usr/lib64/php7.4/man/:/usr/local/share/man:/usr/share/man:/usr/lib/llvm/10/share/man"
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
OLDPWD="/etc/portage"
PAGER="less"
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/lib/llvm/10/bin"
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
SSH_CLIENT="74.70.75.98 54020 22"
SSH_CONNECTION="74.70.75.98 54020 95.217.117.234 22"
SSH_TTY="/dev/pts/1"
SYMLINK_LIB="no"
SYSROOT="/"
TERM="xterm-256color"
TWISTED_DISABLE_WRITING_OF_PLUGIN_CACHE="1"
UNINSTALL_IGNORE="/lib/modules/* /var/run /var/lock"
USE="X aac acl acpi alsa amd64 asm avx bash-completion bcache berkdb blksha1 bluray boost branding bzip2 cairo caps ccache cflags cli contrib corefonts crypt curl custom-cflags custom-optimization custom-tune cxx daemon dev-libs dri dri3 dts encode eselect exif expat fbcon ffmpeg flac flambda fontconfig fortran fpm gd gdbm gif git gmp go gold gpm graphite guile guile2 gzip handbook hddtemp hexpat hoogle hscolour hwloc iconv icu idn initramfs inotify jemalloc jpeg jpeg2k json jsonc lame lcms libnotify libsamplerate libssh libtirpc lm-sensors lm_sensors lock lrzip lto lv4 lz4 lzma lzo mad matroska mdadm mime mmap mmx mmxext mng mp3 mp4 mpeg mpi multilib multitarget ncurses nlopt nls nptl nscd nvidia offensive offload ogg oil openal opencl opengl openmp optimised-mixer optimizations optimize optimize-gmp orc override-flagomatic pam pango pch pclmul pcre pcre-jit pcre16 pcre2 pcre32 pdf perl pgo pic plugins png policykit popcnt ppds profile profiler profiling pypy3 python r_suggests_spacetime rar rdesktop readline reflex-optimizer resize-optimization sctp sdl seccomp session smp sndfile snmp sockets socks5 sound source spacetime spell split-usr sqlite ssh ssl startup-notification strong-optimization svg syslog system-av1 system-bzip2 system-cairo system-ffmpeg system-harfbuzz system-icu system-jpeg system-libevent system-libvpx system-libwebp system-lua system-openssl system-sqlite system-zlib systemd systemtap szip tcl tcmalloc tcpd telemetry text theora threads tidy tiff tk tools truetype twolame udev udisks unicode unzip upnp upnp-av upower usr-portage util utils uvm vaapi vdo vdpau vhosts vim vim-syntax vorbis vpx vulkan webkit webp webui wmf wxwidgets x264 x265 xattr xcb xcomposite xface xft xine xinetd xla xml xmlrpc xmpp xorg xpm xscreensaver xv xvid xz zeroconf zip zlib zsh zsh-completion zstd" ABI_X86="64" ADA_TARGET="gnat_2018" ALSA_CARDS="hda-intel nvidia nv dummy" APACHE2_MODULES="actions alias auth_basic authn_alias authn_anon authn_core authn_dbm authn_default authn_file authz_core authz_dbm authz_default authz_groupfile authz_host authz_owner authz_user autoindex cache cgi cgid dav dav_fs dav_lock deflate dir disk_cache env expires ext_filter file_cache filter headers include info log_config logio mem_cache mime mime_magic negotiation rewrite setenvif socache_shmcb speling status unique_id unixd userdir usertrack vhost_alias" CALLIGRA_FEATURES="karbon sheets words" COLLECTD_PLUGINS="df interface irq load memory rrdtool swap syslog" CPU_FLAGS_X86="aes avx avx2 f16c fma3 mmx mmxext pclmul popcnt sha sse sse2 sse3 sse4_1 sse4_2 sse4a ssse3" ELIBC="glibc" GPSD_PROTOCOLS="aivdm ashtech earthmate evermore fv18 garmin garmintxt gpsclock greis isync itrax mtk3301 navcom nmea ntrip oceanserver oldstyle oncore rtcm104v2 rtcm104v3 sirf skytraq superstar2 timing tnt tripmate tsip ublox ubx" GRUB_PLATFORMS="pc efi-64" INPUT_DEVICES="keyboard mouse evdev libinput" KERNEL="linux" L10N="en en_US en-US" LCD_DEVICES="bayrad cfontz cfontz633 glk hd44780 lb216 lcdm001 mtxorb ncurses text" LIBREOFFICE_EXTENSIONS="presenter-console presenter-minimizer" LLVM_TARGETS="BPF NVPTX X86 AArch64 ARM WebAssembly XCore" NGINX_MODULES_HTTP="access fastcgi gzip proxy rewrite" OFFICE_IMPLEMENTATION="libreoffice" PHP_TARGETS="php7-2" POSTGRES_TARGETS="postgres11" PYTHON_SINGLE_TARGET="python3_8" PYTHON_TARGETS="python3_8" QEMU_SOFTMMU_TARGETS="x86_64 aarch64 arm" QEMU_USER_TARGETS="x86_64 aarch64 arm" RUBY_TARGETS="ruby27" USERLAND="GNU" VIDEO_CARDS="nv nvidia vesa fbdev nouveau dummy v4l" XTABLES_ADDONS="account chaos condition delude dhcpmac fuzzy geoip iface ipmark ipp2p ipset ipv4options length2 logmark lscan pknock psd quota2 rawnat steal sysrq tarpit tee"
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
XDG_SESSION_ID="c27"
XDG_SESSION_TYPE="tty"
XTABLES_ADDONS="account chaos condition delude dhcpmac fuzzy geoip iface ipmark ipp2p ipset ipv4options length2 logmark lscan pknock psd quota2 rawnat steal sysrq tarpit tee"
_NO_SSP="-fno-stack-protector -fno-stack-clash-protection -fstack-check=no -fno-stack-check"
```
