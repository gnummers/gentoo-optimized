#!/bin/sh
set -x

[ $(id -u) -eq 0 ] || exec sudo $0 $@

for bin in /var/lib/rancher/k3s/data/**/bin/; do
    [ -d $bin ] && export PATH=$bin:$PATH
done

for service in /etc/systemd/system/k3s*.service; do
    [ -s $service ] && systemctl stop $(basename $service)
done

for service in /etc/init.d/k3s*; do
    [ -x $service ] && $service stop
done

pstree() {
    for pid in $@; do
        echo $pid
        pstree $(ps -o ppid= -o pid= | awk "\$1==$pid {print \$2}")
    done
}

killtree() {
    [ $# -ne 0 ] && kill $(set +x; pstree $@; set -x)
}

killtree $(lsof | sed -e 's/^[^0-9]*//g; s/  */\t/g' | grep -w 'k3s/data/[^/]*/bin/containerd-shim' | cut -f1 | sort -n -u)

do_unmount() {
    MOUNTS=$(cat /proc/self/mounts | awk '{print $2}' | grep "^$1" | sort -r)
    if [ -n "${MOUNTS}" ]; then
        umount ${MOUNTS}
    fi
}

do_unmount '/run/k3s'
do_unmount '/var/lib/rancher/k3s'

nets=$(ip link show | grep 'master cni0' | awk -F': ' '{print $2}' | sed -e 's|@.*||')

for iface in $nets; do
    ip link delete $iface;
done

ip link delete cni0
ip link delete flannel.1

rm -rf /var/lib/cni/
