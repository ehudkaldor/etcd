################################################
#
#
#
#
#
################################################

FROM					ehudkaldor/alpine-s6:latest
MAINTAINER		Ehud Kaldor <ehud@unfairfunction.org>

RUN						apk add --update ca-certificates curl jq etcd etcd-ctl && \
							# /opt/install-etcd.sh && \
							# cp /tmp/test-etcd/etcd /tmp/test-etcd/etcdctl /usr/bin && \
							rm -rf /var/cache/apk/*

EXPOSE				2379 2380

COPY					rootfs /

ENTRYPOINT		["/init"]
