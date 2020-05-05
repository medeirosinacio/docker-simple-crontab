#!/bin/sh

set -e

TZ=America/Sao_Paulo
CRON_LOG=/var/log/crontab.log

# CONFIG TIMEZONE
# https://wiki.alpinelinux.org/wiki/Setting_the_timezone
if [[ "${TZ}" != "" ]]; then
    if [[ -f "/usr/share/zoneinfo/${TZ}" ]]; then
        cp "/usr/share/zoneinfo/${TZ}" /etc/localtime
        echo "${TZ}" >  /etc/timezone
    fi
fi

# CONFIG FILE CRON
if [[ "${CRON_FILE}" != "" ]]; then
    if [[ -f "${CRON_FILE}" ]]; then
        cp ${CRON_FILE} /etc/crontabs/root
        chown root:root /etc/crontabs/root
    fi
fi

# SEND LOG TO DOCKER LOGS
ln -sf /var/log/crontab.default.log ${CRON_LOG}

/usr/sbin/crond -f -l 7 -L "${CRON_LOG}"