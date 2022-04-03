#!/bin/bash

HDDS="sdf sda sde sdd"

errquit() {
    STATUS=1
    _errlog "$@"
    exit 1
}

echo "Rebuilding hdd's to /dev/md9 array"

for disk in ${HDDS}; do
    if [ ! -e /dev/${disk} ]; then
        errquit "Could not find /dev/${disk}"
    else
        mdadm /dev/md9 --re-add /dev/${disk}1
    fi
done

echo "Rebuilding hdd's to /dev/md13 array"

for disk in ${HDDS}; do
    if [ ! -e /dev/${disk} ]; then
        errquit "Could not find /dev/${disk}"
    else
        mdadm /dev/md13 --re-add /dev/${disk}4
    fi
done
