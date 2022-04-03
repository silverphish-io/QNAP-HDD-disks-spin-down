#!/bin/bash

HDDS="sdf sda sde sdd"

errquit() {
    STATUS=1
    _errlog "$@"
    exit ${STATUS}
}

echo "Disconnecting hdd's from /dev/md9 array"

for disk in ${HDDS}; do
    if [ ! -e /dev/${disk} ]; then
        errquit "Could not find /dev/${disk}"
    else
        mdadm /dev/md9 --fail /dev/${disk}1
    fi
done

echo "Disconnecting hdd's from /dev/md13 array"

for disk in ${HDDS}; do
    if [ ! -e /dev/${disk} ]; then
        errquit "Could not find /dev/${disk}"
    else
        mdadm /dev/md13 --fail /dev/${disk}4
    fi
done
