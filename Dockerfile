################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6-confd
MAINTAINER	Ehud Kaldor <ehud@unfairfunction.org>

RUN 		apk ca-certificates curl && \
		rm -rf /var/cache/apk/*

COPY 		rootfs /

RUN		/opt/install-etcd.sh

ENTRYPOINT	["/init"]

