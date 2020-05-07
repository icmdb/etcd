ARG ETCD_VERSION=v3.4.7
ARG ALPINE_VERSION=3.11

FROM alpine:${ALPINE_VERSION} as build
ARG ETCD_VERSION

RUN    apk add --update \
         ca-certificates \
         openssl \
         tar \
    && wget -c https://github.com/coreos/etcd/releases/download/${ETCD_VERSION}/etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
    && tar xzvf etcd-${ETCD_VERSION}-linux-amd64.tar.gz \
    && mv etcd-${ETCD_VERSION}-linux-amd64/etcd* /usr/local/bin/ \
    && apk del --purge tar openssl \
    && rm -Rf etcd-${ETCD_VERSION}-linux-amd64* /var/cache/apk/*


FROM alpine:${ALPINE_VERSION}
ENV PATH=$PATH:/usr/local/bin/
ENV ETCD_GITHUB=https://github.com/etcd-io/etcd \
    ETCD_DOCS=https://etcd.io/
ENV ETCD_NAME=etcd-0 \
    ETCD_DATA=/data \
    ETCD_CLIENT_URLS=http://0.0.0.0:2379 \
    ETCD_PEER_URLS=http://0.0.0.0:2380 \
    ETCD_INI_TOKEN=Token \
    ETCD_INI_STATE=new \
    ETCD_LOG_LEVEL=info \
    ETCD_LOGGER=zap \
    ETCD_OUTPUTS=stderr 

RUN    apk add --update \
         ca-certificates \

COPY --from=build /usr/local/bin/etcd    /usr/local/bin/etcd
COPY --from=build /usr/local/bin/etcdctl /usr/local/bin/etcdctl

VOLUME /data
EXPOSE 2379 2380 4001 7001
ADD . /etcd/
ENTRYPOINT ["/etcd/docker-entrypoint.sh"]
