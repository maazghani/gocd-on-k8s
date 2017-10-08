#!/bin/bash

set -e

if [ "$1" = 'go-agent' ]; then
    mkdir -p /var/lib/go-agent/config
    cp /tmp/autoregister.properties /var/lib/go-agent/config/
    chown -R go:go /var/lib/go-agent/config
    echo export GO_SERVER_URL="$GO_SERVER_URL" >> /etc/default/go-agent
    echo export DAEMON=N >> /etc/default/go-agent
    echo go ALL=NOPASSWD: /usr/bin/docker >> /etc/sudoers
    /etc/init.d/go-agent start
fi

exec "$@"
