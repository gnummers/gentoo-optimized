#!/usr/bin/python
import re

url_map = {
    "golang.org": "github.com/golang",
    "google.golang.org": "github.com/golang",
    "docker.io": "github.com/docker",
    "k8s.io": "github.com/kubernetes",
    "sigs.k8s.io": "github.com/kubernetes-sigs",
    "gopkg.in": "github.com/go-",
    "go.etcd.io": "github.com/etcd-io"
}

with open("go.mod", "r") as file:
    data = file.read()

# First get replace to ignore requires later
replaced = set()

replace = re.search(r"replace \(([^\)]*)\)", data)
if replace:
    for line in replace.group(1).splitlines():
        pkg = re.match(r"\t(?P<pkg>[^ ]*) => (?P<version>[^ ]*)\s.*", line)
        if pkg:
            replaced.add(pkg.group(1))

require = re.search(r"require \(([^\)]*)\)", data)
if require:
    print("EGO_VENDOR=(")
    for line in require.group(1).splitlines():
        pkg = re.match(r"\t(?P<pkg>[^ ]*) (?P<version>[^ ]*)\s.*", line)
        if pkg and pkg.group('version') not in replaced:
            ver = re.match(r"v\d.\d.\d-.*-(?P<commit>[^ ]*)", pkg.group('version'))
            if ver:
                commit = ver.group('commit')
            else:
                commit = pkg.group('version')
                commit = re.sub("\+incompatible", "", commit)

            pkg_tokens = pkg.group('pkg').split("/")
            if pkg_tokens[0] in url_map.keys():
                if pkg_tokens[0] == "gopkg.in":
                    (pkg_name, branch) = pkg_tokens[-1].split(".")
                    print("\t\"{}/{} {} {}{}/{}\"".format("/".join(pkg_tokens[:-1]), pkg_tokens[-1], commit, url_map[pkg_tokens[0]], pkg_name, pkg_name))
                else:
                    print("\t\"{}/{} {} {}/{}\"".format("/".join(pkg_tokens[:-1]), pkg_tokens[-1], commit, url_map[pkg_tokens[0]], pkg_tokens[-1]))
            else:
                print("\t\"{} {}\"".format(pkg.group('pkg'), commit))
    print("\t)")
