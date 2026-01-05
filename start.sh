#!/bin/sh
echo "0 3 * * * /usr/sbin/logrotate /etc/logrotate.d/vector" | crontab -
crond
exec vector