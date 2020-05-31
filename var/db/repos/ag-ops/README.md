# ag-ops

Set of ebuilds for SysAdmins or DevOps for use on Gentoo.
An attempt is made to keep updated versions of some useful tools.

## Usage

Please see the [Gentoo Wiki](https://wiki.gentoo.org/wiki/Ebuild_repository) for an expanded overview 
of ebuilds and unofficial repositories for Gentoo.

You can enable this overlay by simply executing the following:

```
eselect repository enable ag-ops
```

This assumes that you have installed the `app-eselect/eselect-repository` package.



#### Packages

| Count | Category/Name       | Description                    |
|-------|------------|--------------------------------|
| 1     | `sys-process/netatop`   | Optional kernel module for `atop` to gather statistics about TCP/UDP packets transmitted/received per process and per thread  |
| 2     | `dev-lua/ldoc`   | A LuaDoc-compatible documentation generation system	|
| 3     | `dev-lua/lgi`   | Lua bindings using gobject-introspection	|
| 4     | `dev-lua/luafilesystem`   | File System Library for the Lua Programming Language	|
| 5     | `dev-lua/luaposix`   | Bindings for POSIX APIs	|
| 6     | `dev-lua/penlight`   | Lua utility libraries loosely based on the Python standard libraries	|
| 7     | `dev-lua/say`   | Lua String Hashing/Indexing Library 	|
| 8     | `net-irc/weechat`   | Portable and multi-interface IRC client		|

