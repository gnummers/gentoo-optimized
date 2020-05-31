### Configuring your _git clone_ localy
Make sure that your _.git/config_ has the following settings:

    [remote "origin"]
        fetch = +refs/heads/*:refs/remotes/origin/*
        url = git+ssh://git@git.overlays.gentoo.org/proj/python.git
        pushurl = git@github.com:gentoo/python.git
        pushurl = git+ssh://git@git.overlays.gentoo.org/proj/python.git
    [remote "github"]
        url = git@github.com:gentoo/python.git
        fetch = +refs/heads/*:refs/remotes/github/*

You can pull/push to both repos at once using _--all_ switch.
