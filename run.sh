#!/bin/bash

set -e

CONFIG_DIR=/etc/transmission-daemon
SETTINGS=$CONFIG_DIR/settings.json
TRANSMISSION=/usr/bin/transmission-daemon

GATEWAY_IP="$(ip route | grep default | awk '{print $3}')"

if [ -z $USERNAME ]; then
    USERNAME="Transmission"
fi
if [ -z $PASSWORD ]; then
    PASSWORD="password"
fi
if [ -z $RPC_PORT ]; then
    RPC_PORT=80
fi

cat > $SETTINGS <<EOF
{
    "bind-address-ipv4": "0.0.0.0",
    "bind-address-ipv6": "::",
    "download-dir": "/mnt/bt/kodi",
    "download-limit": 100,
    "download-limit-enabled": 0,
    "incomplete-dir": "/mnt/bt/kodi/.unfinished",
    "incomplete-dir-enabled": true,
    "preallocation": 2,
    "prefetch-enabled": true,
    "start-added-torrents": false,
    "umask": 91,
    "watch-dir": "/mnt/bt/kodi/torrents/",
    "watch-dir-enabled": true,
    "trash-original-torrent-files": false,
    "cache-size-mb": 128,
    "dht-enabled": true,
    "lpd-enabled": false,
    "message-level": 2,
    "encryption": 1,
    "script-torrent-done-enabled": false,
    "script-torrent-done-filename": "",
    "utp-enabled": true,
    "idle-seeding-limit": 30,
    "idle-seeding-limit-enabled": true,
    "max-peers-global": 200,
    "message-level": 1,
    "peer-congestion-algorithm": "",
    "peer-id-ttl-hours": 6,
    "peer-limit-global": 200,
    "peer-limit-per-torrent": 60,
    "peer-port": 12345,
    "peer-port-random-on-start": false,
    "peer-port-random-high": 65535,
    "peer-port-random-low": 49152,
    "peer-socket-tos": "default",
    "pex-enabled": true,
    "download-queue-enabled": true,
    "download-queue-size": 3,
    "queue-stalled-enabled": true,
    "queue-stalled-minutes": 30,
    "port-forwarding-enabled": true,
    "ratio-limit": 1,
    "ratio-limit-enabled": true,
    "rename-partial-files": true,
    "rpc-authentication-required": true,
    "rpc-enabled": true,
    "rpc-port": $RPC_PORT,
    "rpc-bind-address": "0.0.0.0",
    "rpc-host-whitelist": "",
    "rpc-host-whitelist-enabled": true,
    "rpc-url": "/transmission/",
    "rpc-username": "$USERNAME",
    "rpc-password": "$PASSWORD",
    "rpc-whitelist": "127.0.0.1,$GATEWAY_IP",
    "rpc-whitelist-enabled": true,
    "scrape-paused-torrents-enabled": true,
    "script-torrent-done-enabled": false,
    "script-torrent-done-filename": "",
    "seed-queue-enabled": false,
    "seed-queue-size": 10,
    "speed-limit-down": 2048,
    "speed-limit-down-enabled": true,
    "speed-limit-up": 500,
    "speed-limit-up-enabled": true,
    "upload-limit": 100,
    "upload-limit-enabled": 0,
    "upload-slots-per-torrent": 14,
    "alt-speed-down": 10240,
    "alt-speed-enabled": false,
    "alt-speed-time-begin": 0,
    "alt-speed-time-day": 127,
    "alt-speed-time-enabled": true,
    "alt-speed-time-end": 360,
    "alt-speed-up": 2048,
    "blocklist-enabled": false,
    "blocklist-url": "http://www.example.com/blocklist"
}
EOF

exec $TRANSMISSION -f --config-dir $CONFIG_DIR 

