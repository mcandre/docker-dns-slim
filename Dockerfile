FROM progrium/busybox
MAINTAINER Andrew Pennebaker <andrew.pennebaker@gmail.com>

RUN opkg-install nsd openssl
RUN addgroup network
RUN adduser -D -G network network
RUN mkdir -m 0775 -p /var/run/nsd3 && \
		chown -R network:network /var/run/nsd3

ADD nsd.conf /etc/nsd3/nsd.conf
ADD sneaky.net.zone /etc/nsd3/sneaky.net.zone
ADD 59.141.3.in-addr.arpa.zone /etc/nsd3/59.141.3.in-addr.arpa.zone
RUN mkdir -p /var/db/nsd && \
					chown network:network /var/db/nsd

EXPOSE 53/udp 53/tcp

ENTRYPOINT /usr/sbin/nsd -d -c /etc/nsd3/nsd.conf
