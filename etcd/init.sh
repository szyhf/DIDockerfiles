#!/bin/sh
export CONTAINER_REMOTE_IP=$(ip route|awk '/default/ { print $3 }')
etcd $*