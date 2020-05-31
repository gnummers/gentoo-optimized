# ethereum-gentoo-overlay
This is a [Gentoo repository](https://overlays.gentoo.org/) containing packages related to the [Ethereum](https://ethereum.org) project.

## Setup

If absent in your system, install git:

    emerge --ask dev-vcs/git
    
Add the following content to `/etc/portage/repos.conf/ethereum.conf`:

    [ethereum]
    location = /var/db/repos/ethereum
    sync-type = git
    sync-uri = https://github.com/coolparadox/ethereum-gentoo-overlay.git
    auto-sync = yes

Sync the added repository:

    emerge --sync ethereum

## Bugs

Likely -- feel free to [file an issue](https://bugs.gentoo.org/enter_bug.cgi?product=Gentoo%20Linux&component=Overlays&short_desc=[ethereum%20overlay]%20%3Cbug%20summary%3E).
Pull requests are also welcome.

-----

_Regards,  
Rafael Lorandi_
