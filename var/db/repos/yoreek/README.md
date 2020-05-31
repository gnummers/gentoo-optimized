Yoreek ebuild repository
============================================

Introduction
------------

This personal repository contains ebuilds and fixes for packages that
i'm interested in.


Using repository with newer portage
-----------------------------------

A package manager with git repository support can be used for sync.
Portage version 2.2.16 and later supports git sync.

The `repos.conf` entry for repository sync may look like the following:

    [yoreek]
    location = /usr/local/portage/yoreek
    sync-type = git
    sync-uri = https://github.com/gentoo-mirror/yoreek.git
    auto-sync = true

Please note that if you use existing repository location, you *need to
remove the existing repository first*.


Using repository with layman
----------------------------

With layman repository must be added first using command:

    layman -a yoreek

Synchronization can be done with command:

    layman -s yoreek
