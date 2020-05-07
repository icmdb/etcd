# etcd

Etcd image based on alpine linux and official binary release.


## Quick Start

```
# with docker run
docker run -d --name etcd icmdb/etcd 


# With docker-compose
mkdir etcd && cd etcd
cat > docker-compose.yml <<EOT
version: "3"
services:
  etcd:
    container_name: etcd
    hostname: etcd
    image: icmdb/etcd
    environment:
      - ETCD_NAME=etcd-0
      - ETCD_DATA=/data/
      - ETCD_CLIENT_URLS=http://0.0.0.0:2379
      - ETCD_PEER_URLS=http://0.0.0.0:2380
      - ETCD_INI_TOKEN=Token
      - ETCD_INI_STATE=new
      - ETCD_LOG_LEVEL=info
      - ETCD_LOGGER=zap
      - ETCD_OUTPUTS=stderr
    ports:
      - 2379:2379
      - 2380:2380
    volumes:
      - ./data/etcd-0:/data
EOT

docker-compose up -d
```

## Reference


* [etcd-io/etcd - GitHub](https://github.com/etcd-io/etcd)
* [etcd release - GitHub](https://github.com/etcd-io/etcd/releases)
* [colebrumley/docker-etcd - GitHub](https://github.com/colebrumley/docker-etcd)
* [ETCD Manager - electronjs.org](https://www.electronjs.org/apps/etcd-manager)

