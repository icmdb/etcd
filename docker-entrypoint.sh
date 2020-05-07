#!/bin/sh
#
#   ETCD_NAME           # shadow
#   ETCD_DATA
#   ETCD_CLIENT_URLS
#   ETCD_PEER_URLS
#   ETCD_INI_TOKEN
#   ETCD_INI_STATE
#   ETCD_LOG_LEVEL      # shadow
#   ETCD_LOGGER         # shadow
#   ETCD_OUTPUTS
#


ETCD_CMD="/usr/local/bin/etcd \
  --data-dir ${ETCD_DATA} \
  --listen-client-urls ${ETCD_CLIENT_URLS} \
  --advertise-client-urls ${ETCD_CLIENT_URLS} \
  --listen-peer-urls ${ETCD_PEER_URLS} \
  --initial-advertise-peer-urls ${ETCD_PEER_URLS} \
  --initial-cluster ${ETCD_NAME}=${ETCD_PEER_URLS} \
  --initial-cluster-token ${ETCD_INI_TOKEN} \
  --initial-cluster-state ${ETCD_INI_STATE} \
  --log-outputs ${ETCD_OUTPUTS} ${@}"

echo -e "Running '$ETCD_CMD'\nBEGIN ETCD OUTPUT\n"

exec $ETCD_CMD
