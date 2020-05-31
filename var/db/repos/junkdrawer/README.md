# Gentoo junkdrawer overlay

A [Gentoo overlay][] with a random assortment of development tools, libraries,
updates, and patches not in the Gentoo tree (yet).

Much of the motivation for this overlay was in breaking apart packages that
insisted on including other projects in their source tree or build system. If a
tool or library *can* be shared system-wide it *should* be!

## Metadata

This overlay implements metadata-alt to improve tracking of upstream releases.
More information can be found on the [metadata-alt GitHub project][].

[Gentoo overlay]: https://wiki.gentoo.org/wiki/Ebuild_repository
[metadata-alt GitHub project]: https://github.com/doctaweeks/gentoo-metadata-alt
