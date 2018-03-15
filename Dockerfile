################################################
#
#
#
#
#
################################################

FROM		ehudkaldor/alpine-s6-rpi:latest
MAINTAINER	Ehud Kaldor <ehud@unfairfunction.org>

RUN						apk add --update \
							ca-certificates \
							curl \
							git \
							g++ \
							etcd \
							etcd-ctl \
							autoconf \
							automake \
							make \
							libtool && \
							# /opt/install-etcd.sh && \
							# cp /tmp/test-etcd/etcd /tmp/test-etcd/etcdctl /usr/bin && \
							rm -rf /var/cache/apk/*

#install jq from source
RUN						git clone https://github.com/stedolan/jq.git && \
							cd jq && \
							git submodule update --init && \
							autoreconf -fi && \
							./configure --with-oniguruma=builtin && \
							make -j8 && \
							make check && \
							make install

EXPOSE				2379 2380

COPY					rootfs /

ENTRYPOINT		["/init"]
