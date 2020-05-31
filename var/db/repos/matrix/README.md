# Matrix Gentoo overlay

This Gentoo overlay contains clients and servers for the Matrix protocol

## Installation

This repository can be added manually or using [eselect-repository](https://wiki.gentoo.org/wiki/Eselect/Repository)
or Layman.

### eselect-repository

```
# eselect repository enable matrix
```

### Layman

Make sure the Layman overlay list is up-to-date

```
# layman -S
# layman -a matrix
```

### Manually

1. Clone this repository somewhere
```
$ git clone https://gitlab.com/steils/matrix-overlay
```

2. Create a new file called `matrix.conf` in `/etc/portage/repos.conf/` with the
following content:
```
[matrix]
location = /path/to/cloned/repository
```

3. Install the package(s) using Portage
4. To update the overlay just run `git pull` in the cloned repository

## Contributing

Don't hesitate to create a MR for any other Matrix clients, servers and other
services!

You can report any ebuild issues or feature requests in the [issue tracker](https://gitlab.com/steils/matrix-overlay/issues)
or in [Gentoo's Bugzilla](https://bugs.gentoo.org/) (Gentoo Linux product,
Overlays component).
