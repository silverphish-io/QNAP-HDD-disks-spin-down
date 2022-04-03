if crontab -l | grep -q 'rebuild_internal_raid'; then
    # Nothing to do; /etc/config/ is on a persistent storage and was already modified
    :
else
    echo "15 10 * * * /share/scripts/rebuild_internal_raid.sh" >> /etc/config/crontab
    crontab /etc/config/crontab && /etc/init.d/crond.sh restart
fi

if crontab -l | grep -q 'disconnect_internal_raid'; then
    # Nothing to do; /etc/config/ is on a persistent storage and was already modified
    :
else
    echo "30 10 * * * /share/scripts/disconnect_internal_raid.sh" >> /etc/config/crontab
    crontab /etc/config/crontab && /etc/init.d/crond.sh restart
fi

exec /share/scripts/disconnect_internal_raid.sh

echo "Turning system swap off"
swapoff -a

