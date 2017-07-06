################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6-confd
MAINTAINER	Ehud Kaldor <ehud@unfairfunction.org>

COPY            rootfs /

RUN 		apk add --update ca-certificates curl jq && \
		/opt/install-etcd.sh && \
		cp /tmp/test-etcd/etcd /tmp/test-etcd/etcdctl /usr/bin && \
		rm -rf /var/cache/apk/*

EXPOSE		2379 2380

ENTRYPOINT	["/init"]

