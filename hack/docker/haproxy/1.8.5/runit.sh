#!/bin/bash

export HAPROXY_CONTROLLER_ARGS="$@"
export > /etc/envvars

[[ $DEBUG == true ]] && set -x

# create haproxy.cfg dir
mkdir /etc/haproxy
touch /var/run/haproxy.pid
mkdir -p /etc/ssl/private/haproxy

# move lua (module not found error)
mv /usr/share/lua /usr/local/share/
mv /usr/lib/lua /usr/local/lib/

echo "Starting runit..."
exec /sbin/runsvdir -P /etc/service
