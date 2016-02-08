FROM progrium/busybox
MAINTAINER Andrew Pennebaker <andrew.pennebaker@gmail.com>
COPY nsd.conf /etc/nsd3/nsd.conf
COPY sneaky.net.zone /etc/nsd3/sneaky.net.zone
COPY 59.141.3.in-addr.arpa.zone /etc/nsd3/59.141.3.in-addr.arpa.zone
RUN opkg-install nsd && \
    adduser -D network && \
    mkdir -m 0775 -p /var/run/nsd3 && \
    chown -R network /var/run/nsd3 && \
    mkdir -p /var/db/nsd && \
    chown network:network /var/db/nsd

EXPOSE 53/udp 53/tcp
ENTRYPOINT ["/usr/sbin/nsd", "-d", "-c", "/etc/nsd3/nsd.conf"]
