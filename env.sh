#!/bin/sh

export ETCD_NAME=etcd-0
export ETCD_DATA=/data
export ETCD_CLIENT_URLS=http://0.0.0.0:2379
export ETCD_PEER_URLS=http://0.0.0.0:2380
export ETCD_INI_TOKEN=Token
export ETCD_INI_STATE=new
export ETCD_LOG_LEVEL=info
export ETCD_LOGGER=zap
export ETCD_OUTPUTS=stderr
