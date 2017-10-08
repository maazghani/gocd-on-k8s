#!/bin/bash

set -e

if [ "$1" = 'go-server' ]; then
    echo export DAEMON=N >> /etc/default/go-server

    # import the original cruise config if it doesn't exist yet
    if [[ ! -f /etc/go/cruise-config.xml ]]; then
        mkdir -p /etc/go/
        cp /tmp/cruise-config.xml /etc/go/
    fi

    chown -R go:go /var/lib/go-server
    chown -R go:go /etc/go
    /etc/init.d/go-server start
fi

exec "$@"
