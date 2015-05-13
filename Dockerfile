FROM debian:jessie
MAINTAINER Andrew Pennebaker <andrew.pennebaker@gmail.com>

RUN apt-get update
RUN apt-get install -y nsd openssl
RUN mkdir -m 0775 -p /var/run/nsd3 && \
		chown -R nsd:nsd /var/run/nsd3

ADD nsd.conf /etc/nsd3/nsd.conf
ADD sneaky.net.zone /etc/nsd3/sneaky.net.zone
ADD 59.141.3.in-addr.arpa.zone /etc/nsd3/59.141.3.in-addr.arpa.zone
RUN /usr/sbin/nsd-control-setup

EXPOSE 53/udp 53/tcp

ENTRYPOINT /usr/sbin/nsd -d -c /etc/nsd3/nsd.conf
