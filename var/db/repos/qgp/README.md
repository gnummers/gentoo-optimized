# qgp overlay

This Gentoo overlay contains ebuilds for various packages, mostly related to 
computing and HEP (in particular ALICE).

## Using the overlay

The overlay can be enabled in various ways.

### eselect-repository

Add the overlay with:
```
eselect repository enable qgp
```

### repos.conf
Add [qgp.conf](https://raw.github.com/qgp/gentoo-qgp/master/metadata/qgp.conf) to
```/etc/portage/repos.conf/```, e.g. using:
```
curl https://raw.github.com/qgp/gentoo-qgp/master/metadata/qgp.conf -o /etc/portage/repos.conf/qgp.conf
```

### layman
The overlay can be added using:
```
layman -a qgp
```
